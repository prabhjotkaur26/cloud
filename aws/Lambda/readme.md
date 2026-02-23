# WHAT IS LAMBDA?
AWS Lambda is a serverless compute service that lets you run code without managing servers.

👉 You just upload your code.
👉 AWS runs it for you.
👉 You pay only when your code runs.

Think of it as:
“Run my code when something happens.”

## 1️⃣ What Does “Serverless” Mean?

Serverless does NOT mean no servers.

It means:

- You don’t create or manage servers

- You don’t patch or scale them

- AWS handles infrastructure automatically

Lambda automatically:

- Scales up when traffic increases

- Scales down to zero when idle

- Handles availability

## 2️⃣ Simple Real-World Example

Imagine you run an online store.

When:

A customer uploads an image → resize it

A customer places an order → send confirmation email

A file is uploaded → process it

Instead of running a full server 24/7, you use Lambda to run code only when needed.

## 3️⃣ How AWS Lambda Works (Step-by-Step)

You write code (called a function).

You upload it to Lambda.

You connect a trigger (an event source).

When the event happens → Lambda runs your code.

That’s it.

## 4️⃣ What is a Lambda Function?

A Lambda Function is:

A small piece of code

Written in languages like:

- Python

- Node.js

- Java

- C#

- Go

Example (Python):

def lambda_handler(event, context):
    return "Hello from Lambda!"
## 5️⃣ What Can Trigger Lambda?

Lambda runs when an event happens.

Common triggers:

1. Amazon S3 → File upload

2. Amazon API Gateway → HTTP request

3. Amazon DynamoDB → Database change

4.Amazon SNS → Notification

5. Amazon SQS → New message

6. Amazon EventBridge → Scheduled event (like cron)

Example:
File uploaded to S3 → triggers Lambda → processes file

## 6️⃣ Key Features of Lambda
🔹 Automatic Scaling

If:

1 user calls it → 1 instance runs

1,000 users call it → 1,000 instances run

No manual scaling required.

🔹 Pay Per Use

You pay for:

Number of requests

Execution time (in milliseconds)

Memory used

If your function doesn’t run → you pay nothing.

🔹 Stateless

Each execution:

Does not remember previous runs

Starts fresh

If you need storage → use:

S3

DynamoDB

RDS

## 7️⃣ Important Concepts
🔹 Execution Role (IAM Role)

Lambda needs permission to:

Read from S3

Write to DynamoDB

Publish to SNS

Permissions are controlled using IAM roles.

🔹 Timeout

Maximum execution time:

15 minutes

If it runs longer → it stops automatically.

🔹 Memory Allocation

You can configure:

128 MB to 10 GB memory

More memory = more CPU power

🔹 Cold Start

If a function hasn’t run recently:

Lambda needs time to initialize environment

This delay is called Cold Start

Warm executions are faster.

## 8️⃣ Lambda Architecture Example
Example: Image Processing App

User uploads image to S3

S3 triggers Lambda

Lambda resizes image

Saves new image back to S3

Fully automatic. No servers.
