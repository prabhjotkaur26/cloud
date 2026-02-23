

# What is DynamoDB?

Amazon DynamoDB is a fast and flexible NoSQL database service provided by Amazon Web Services.

Think of it like:

📦 A super-fast online storage system that can handle millions of users at the same time without slowing down.

It is fully managed, which means:

1.You don’t manage servers

2.You don’t worry about scaling

3.AWS handles everything in the background

### Simple Example

Imagine you are building a shopping app.

You need to store:

- User data

- Products

- Orders

- Cart items

Instead of installing a database on a server, you use DynamoDB to store all this data safely and access it very quickly.

## How DynamoDB Stores Data

DynamoDB uses:

### 1️⃣ Tables

Like a folder that stores data.

Example:

Users table

Orders table

### 2️⃣ Items

Each row in the table.

Example (User item):

UserID: 101
Name: John
Email: john@email.com
### 3️⃣ Attributes

The columns (data fields).

In the example above:

UserID

Name

Email

## Important Concept: Primary Key 🔑

Every table must have a Primary Key.

There are two types:

### 1️⃣ Partition Key (Simple Primary Key)

A unique ID.

Example:

UserID
### 2️⃣ Composite Key (Partition Key + Sort Key)

Used when you want multiple related items grouped together.

Example:

UserID (Partition Key)
OrderID (Sort Key)

This helps store multiple orders for the same user.

## Why is DynamoDB Powerful?

✅ Very fast (single-digit milliseconds response time)
✅ Automatically scales up or down
✅ Fully managed by AWS
✅ Secure
✅ High availability (data stored in multiple locations)# ✅ Method 1: Create DynamoDB Table from AWS Console (Easy Way)
## Step 1️⃣ – Login to AWS

Go to aws.amazon.com

Sign in to your AWS account

Open the AWS Management Console

## Step 2️⃣ – Search for DynamoDB

In the top search bar, type DynamoDB

Click on Amazon DynamoDB

## Step 3️⃣ – Create a Table

Click Create table

You will see a form. Fill it like this:

### 🔹 Table name

Example:

Users
### 🔹 Partition key (Primary Key)

Example:

UserID

Data type:

String (or Number if needed)

You can leave other settings as default for now.

## 4️⃣ – Choose Table Settings

You’ll see two capacity modes:

Option A: On-demand (Recommended for beginners)

Automatically scales

Pay only for what you use

👉 Select On-demand

## Step 5️⃣ – Click Create

Click Create table

Wait a few seconds

🎉 Your DynamoDB table is ready!

## Step 6️⃣ – Add Data to Table

Open your table

Go to Explore table items

Click Create item

Add values like:

UserID: 101
Name: John
Email: john@email.com

Click Save

Done ✅

# ✅ Method 2: Create DynamoDB Using AWS CLI (Optional Advanced)

If you have AWS CLI installed:

aws dynamodb create-table \
    --table-name Users \
    --attribute-definitions AttributeName=UserID,AttributeType=S \
    --key-schema AttributeName=UserID,KeyType=HASH \
    --billing-mode PAY_PER_REQUEST

This creates the same table using command line.
