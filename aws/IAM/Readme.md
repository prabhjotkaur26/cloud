# What is IAM (Identity and Access Management)?

IAM (Identity and Access Management) is a system that controls who can access what in a computer system and what they are allowed to do.

Think of it as a security guard + ID card system for your company’s digital world.

## 🏢 Real-Life Example: Office Building

Imagine a large office building.

### 1️⃣ Identity = “Who are you?”

When you enter the building:

You show your ID card

The guard checks your name and photo

The system verifies you are an employee

In IAM:

Identity = username, password, fingerprint, face ID, etc.

Example: “Rahul – Software Developer”

### 2️⃣ Authentication = “Prove it’s really you”

The guard asks:

1. Show your ID card

2. Maybe enter a PIN

3. Maybe scan your fingerprint

In IAM:

Authentication means verifying your identity

Example:

1. Enter password

2. OTP on phone

3. Face recognition

This is called Multi-Factor Authentication (MFA) when more than one method is used.

### 3️⃣ Authorization = “What are you allowed to do?”

After entering the building:

HR can enter HR room

IT team can enter server room

Interns cannot enter restricted areas

In IAM:

Authorization decides permissions

Example:

1. Developer → Can deploy code

2. HR → Can view employee salary

3. Intern → Cannot access production server

### 4️⃣ Access Control = “Rules of the building”

The building has rules:

Only managers can enter executive floor

Office is open 9 AM – 6 PM

Visitors must be approved

IAM also has rules:

1. Only Admin can delete users

2. Access allowed only during work hours

3. Access allowed only from company laptop

🖥️ IAM in Cloud (Real Example)

Let’s take cloud platforms like:

1. Amazon Web Services (AWS)

2.Microsoft Azure

3.Google Cloud

They all provide IAM services.

### Example in AWS IAM:

Suppose a company uses AWS.

People in company:

-Admin

-Developer

-Tester

-Finance team

### Using IAM, the company can:

✔ Create users
✔ Create roles
✔ Assign permissions
✔ Allow or deny access to services

Example:

- Developer → Can use EC2

- Finance → Can see billing

- Tester → Can read logs

- Only Admin → Can delete servers

### 🔑 Key Components of IAM
1. Users

Individual people (Rahul, Priya)

2. Groups

Team of users (Developers Group)

3. Roles

Temporary access (like visitor pass)

Example:
A developer normally cannot access production.
But when needed, he assumes a “Production Role” temporarily.

### 🎯 Why IAM is Important

Without IAM:

1.Anyone can access anything

2.Data can be stolen

3.Systems can be destroyed accidentally

With IAM:

1.Controlled access

2.Better security

3.Clear responsibility

4.Audit tracking (who did what)

### 🔐 Simple Daily Life Example (Bank App)

When you use a banking app:

You log in → Authentication

You can see your account → Authorization

You cannot see other people's accounts → Access control

That’s IAM working behind the scenes.

# How to create and use IAM in AWS (step-by-step)

IAM is different from EC2.

IAM = Identity and Access Management
It controls who can access AWS and what they can do.

We will use AWS Identity and Access Management in Amazon Web Services.

## 🧠 What is IAM? (Simple Explanation)

IAM helps you:

Create users

Give permissions

Control access to services (like EC2, S3, etc.)

Improve security

👉 Example:
If you have 5 employees, you should NOT share your root account.
Instead, create IAM users for them.

## ✅ Step-by-Step: Create IAM User in AWS
### ✅ Step 1: Login to AWS

Go to AWS Console

Login using root account (first time only)

### ✅ Step 2: Open IAM Service

Search IAM in top search bar

Click IAM

You will see IAM Dashboard.

### ✅ Step 3: Create a New User

Click Users

Click Create user

### ✅ Step 4: Enter User Details

Enter username
Example: dev-user

Select access type:

#### ✅ AWS Management Console access (for login)

✅ Programmatic access (for CLI/API)

Click Next

### ✅ Step 5: Set Permissions

You have 3 options:

Option 1 (Easy – for beginners):

Attach policy directly

Example policies:

AdministratorAccess (full access)

AmazonEC2FullAccess

AmazonS3FullAccess

Select required policy → Click Next

### ✅ Step 6: Review and Create

Review details

Click Create User

Done 🎉

### ✅ Step 7: Save Login Details

AWS will show:

Console login URL

Username

Password (if auto-generated)

⚠️ Download or copy these details.

### ✅ Step 8: Login Using IAM User

Logout root account

Open IAM login URL

Enter:

Account ID

Username

Password

Now you are logged in as IAM user

🎯 Example Real-Life Scenario

Company has:

Dev team

Testing team

Admin team

Using IAM:

Dev team → EC2 access only

Testing team → Read-only access

Admin team → Full access

This improves security.
