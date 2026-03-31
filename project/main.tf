resource "aws_s3_bucket" "upload_bucket" {
  bucket = "prabhjot100"
}

resource "aws_s3_bucket_notification" "enable_eventbridge" {
  bucket = aws_s3_bucket.upload_bucket.id

  eventbridge = true
}

# ================= IAM =================

# Lambda Role
resource "aws_iam_role" "lambda_role" {
  name = "lambda_exec_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Action = "sts:AssumeRole"
      Effect = "Allow"
      Principal = {
        Service = "lambda.amazonaws.com"
      }
    }]
  })
}

resource "aws_iam_role_policy_attachment" "lambda_basic" {
  role       = aws_iam_role.lambda_role.name
  policy_arn = "arn:aws:iam::aws:policy/service-role/AWSLambdaBasicExecutionRole"
}

# Step Function Role
resource "aws_iam_role" "step_function_role" {
  name = "step_function_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "states.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "step_function_policy" {
  role = aws_iam_role.step_function_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = ["lambda:InvokeFunction"]
      Resource = "*"
    }]
  })
}

# EventBridge Role
resource "aws_iam_role" "eventbridge_role" {
  name = "eventbridge_role"

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "events.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

resource "aws_iam_role_policy" "eventbridge_policy" {
  role = aws_iam_role.eventbridge_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = "states:StartExecution"
      Resource = aws_sfn_state_machine.state_machine.arn
    }]
  })
}
resource "aws_iam_role_policy" "lambda_ssm_policy_notification" {
  name = "lambda_ssm_policy_notification"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "ssm:GetParameter"
      ]
      Resource = aws_ssm_parameter.notification_type_param.arn
    }]
  })
}
resource "aws_iam_role_policy" "lambda_s3_policy" {
  name = "lambda_s3_policy"
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Action = [
        "s3:GetObject",
        "s3:HeadObject"
      ]
      Resource = "arn:aws:s3:::prabhjot100/*"
    }]
  })
}
resource "aws_sns_topic_subscription" "email_sub" {
  topic_arn = aws_sns_topic.topic.arn
  protocol  = "email"
  endpoint  = "prabh008968@email.com"
}
resource "aws_iam_role_policy" "lambda_ses_sns_policy" {
  role = aws_iam_role.lambda_role.id

  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = [
          "ses:SendEmail",
          "sns:Publish"
        ]
        Resource = "*"
      }
    ]
  })
}
# ================= ZIP (AUTO CREATE) =================

data "archive_file" "lambda1_zip" {
  type        = "zip"
  source_file = "${path.module}/lambdas/lambda1.py"
  output_path = "${path.module}/lambda_zips/lambda1.zip"
}

data "archive_file" "lambda2_zip" {
  type        = "zip"
  source_file = "${path.module}/lambdas/lambda2.py"
  output_path = "${path.module}/lambda_zips/lambda2.zip"
}

data "archive_file" "lambda3_zip" {
  type        = "zip"
  source_file = "${path.module}/lambdas/lambda3.py"
  output_path = "${path.module}/lambda_zips/lambda3.zip"
}

# ================= LAMBDAS =================

resource "aws_lambda_function" "lambda1" {
  function_name = "lambda1"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda1.lambda_handler"
  runtime       = "python3.11"

  filename         = data.archive_file.lambda1_zip.output_path
  source_code_hash = data.archive_file.lambda1_zip.output_base64sha256
}

resource "aws_lambda_function" "lambda2" {
  function_name = "lambda2"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda2.lambda_handler"
  runtime       = "python3.11"

  filename         = data.archive_file.lambda2_zip.output_path
  source_code_hash = data.archive_file.lambda2_zip.output_base64sha256
}

resource "aws_lambda_function" "lambda3" {
  function_name = "lambda3"
  role          = aws_iam_role.lambda_role.arn
  handler       = "lambda3.lambda_handler"
  runtime       = "python3.11"

  filename         = data.archive_file.lambda3_zip.output_path
  source_code_hash = data.archive_file.lambda3_zip.output_base64sha256
}

# ================= SNS =================

resource "aws_sns_topic" "topic" {
  name = "my-topic"
}
# ================= SSM PARAMETER =================

resource "aws_ssm_parameter" "notification_type_param" {
  name  = "/myapp/notification_type"
  type  = "String"
  value = "sns"   # or "email"
}

# ================= STEP FUNCTION =================

resource "aws_sfn_state_machine" "state_machine" {
  name     = "my-state-machine"
  role_arn = aws_iam_role.step_function_role.arn

  definition = jsonencode({
    StartAt = "Lambda1"
    States = {
      Lambda1 = {
        Type     = "Task"
        Resource = aws_lambda_function.lambda1.arn
        Next     = "ChoiceState"
      }

      ChoiceState = {
        Type = "Choice"
        Choices = [
          {
            "Variable": "$.notification_type"
            StringEquals = "email"
            Next         = "Lambda2"
          },
          {
            "Variable": "$.notification_type"
            StringEquals = "sns"
            Next         = "Lambda3"
          }
        ]
      }

      Lambda2 = {
        Type     = "Task"
        Resource = aws_lambda_function.lambda2.arn
        End      = true
      }

      Lambda3 = {
        Type     = "Task"
        Resource = aws_lambda_function.lambda3.arn
        End      = true
      }
    }
  })
}

# ================= EVENTBRIDGE =================

resource "aws_cloudwatch_event_rule" "s3_rule" {
  name = "s3-upload-rule"

  event_pattern = jsonencode({
    source = ["aws.s3"],
    detail-type = ["Object Created"],
    detail = {
      bucket = {
        name = ["prabhjot100"]
      }
    }
  })
}

resource "aws_cloudwatch_event_target" "step_function_target" {
  rule      = aws_cloudwatch_event_rule.s3_rule.name
  target_id = "SendToStepFunction"
  arn       = aws_sfn_state_machine.state_machine.arn
  role_arn  = aws_iam_role.eventbridge_role.arn

 input_transformer {
  input_paths = {
    bucket = "$.detail.bucket.name"
    key    = "$.detail.object.key"
  }

  input_template = <<EOF
{
  "bucket": <bucket>,
  "key": <key>
}
EOF
}
}