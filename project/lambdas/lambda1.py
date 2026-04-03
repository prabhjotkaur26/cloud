import boto3

ssm = boto3.client('ssm')

def lambda_handler(event, context):
    try:
        # Validate input
        bucket = event.get('bucket')
        key = event.get('key')

        if not bucket or not key:
            raise ValueError("Missing 'bucket' or 'key' in event")

        # Fetch parameter from SSM (with decryption in case it's SecureString)
        response = ssm.get_parameter(
            Name="/myapp/notification_type",
            WithDecryption=True
        )

        notification_type = response['Parameter']['Value']

        # Return structured response
        return {
            "status": "success",
            "bucket": bucket,
            "key": key,
            "notification_type": notification_type
        }

    except Exception as e:
        return {
            "status": "error",
            "message": str(e)
        }