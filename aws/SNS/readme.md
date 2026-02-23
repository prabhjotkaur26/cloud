# 📩 What is SNS?

Amazon Simple Notification Service (SNS) is a service in Amazon Web Services that lets you send messages or notifications to people or systems.

Think of SNS like a notification broadcasting system.

If something happens in your system, SNS can automatically send:

- 📱 SMS

- 📧 Email

- 📦 Message to another AWS service

- 📲 Push notification to mobile app

### 🧠 Simple Example

Imagine:

A file is uploaded to S3

Or a payment is completed

Or a server error happens

SNS can immediately send:

"Payment successful"
"New file uploaded"
"Server is down!"

## 📡 How SNS Works (Very Simple)

SNS works using 2 main things:

### 1️⃣ Topic

A Topic is like a channel.

Example:

Topic name: FileUploadAlerts

### 2️⃣ Subscribers

Subscribers are the people or systems that receive the message.

They can be:

1. Email address

2. Phone number (SMS)

3. Lambda function

4. SQS queue

5. HTTP endpoint

When you send a message to a Topic, SNS sends it to all subscribers.

## 🚀 Where SNS Is Commonly Used

1. OTP verification

2. Application alerts

3. Bank transaction alerts

4. System monitoring alerts

5. File upload notifications

## 🧾 Key Features of SNS

- Fully managed (no server setup)

- Highly scalable

- Pay only for what you use

- Supports multiple subscribers

- Supports SMS worldwide (country restrictions apply)

   ## REAL WORLD EXAMPLE
  File Upload Notification (Your Case)
Situation:

New file uploaded to S3.

Flow:

File uploaded

S3 triggers Lambda

Lambda publishes message to SNS

SNS sends SMS:

New file uploaded: report.pdf

Automatic notification.
