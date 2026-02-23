# What is SES?

Amazon Simple Email Service (SES) is an email sending service from Amazon Web Services.

It allows you to send:

1. 📩 Transactional emails (OTP, password reset)

2. 🧾 Invoices

3. 📢 Marketing emails

4. 📬 Notifications

5. 📎 Emails with attachments

In simple words:

👉 SES is used to send emails from your application.

## 🧠 Simple Example

Imagine you have a website.

When a user:

- Registers → Send welcome email

-Requests password reset → Send reset link

- Places order → Send invoice

Your application calls SES → SES sends the email.

## 🏗 How SES Works (Simple Flow)

1️⃣ Your app / Lambda creates email content
2️⃣ It calls SES
3️⃣ SES delivers email to user inbox

That’s it ✅

## 🎯 What Can SES Send?
### 1️⃣ Transactional Emails

- OTP

- Password reset

- Order confirmation

- Account alerts

### 2️⃣ Marketing Emails

Promotions

Newsletters

Campaign emails

## 🔐 Important Concept: Verification

Before sending emails, SES requires verification.

You must verify:

### ✅ Email address (for testing)
OR

### ✅ Domain (for production)

Example:

Verify yourname@gmail.com
OR

Verify domain yourcompany.com

This prevents spam misuse.
## REAL LIFE EXAMPLE
### Password Reset Email
Situation:

You click “Forgot Password”.

Behind the Scenes:

System generates reset link

Application calls SES

SES sends email:

Click here to reset your password.

Without SES, developers would need to manage their own mail server.
