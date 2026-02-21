# What is Amazon EC2 (Elastic Compute Cloud)?

Amazon EC2 is a cloud service from Amazon Web Services that lets you rent virtual computers over the internet.

### Instead of buying a physical computer (server), you can create a virtual one in minutes and use it to:

Host websites

Run applications

Store and process data

Run machine learning models

Test software

Think of EC2 as renting a computer in Amazon’s data center that you control remotely.

### 🖥️ Simple Real-Life Analogy

Imagine you want to open a restaurant:

❌ Traditional way: Buy land, build building, buy kitchen equipment (expensive & slow)

✅ EC2 way: Rent a fully ready kitchen instantly and pay only for the time you use it

That’s exactly what EC2 does for computers.

## 🔹 What is an EC2 Instance?

An EC2 instance = a virtual server.

When you launch an instance, you choose:

Operating system (Linux, Windows, etc.)

CPU power

RAM size

Storage

Location (region)

It behaves just like a real computer — you can install software, run programs, host websites, etc.

### 🔹 Key Components of EC2 (Explained Simply)
1️⃣ AMI (Amazon Machine Image)

A template for your virtual computer.

It includes:

Operating system

Pre-installed software

Configuration settings

Example:

Ubuntu Linux image

Windows Server image

Think of it like installing Windows on a new laptop.

### 2️⃣ Instance Types (Size of Your Virtual Computer)

EC2 offers different sizes:

Small (for testing)

Medium (for small apps)

Large (for production apps)

GPU-based (for AI/ML)

You pick based on how powerful your app needs to be.

### 3️⃣ Storage (EBS)

EC2 uses Elastic Block Store (EBS) as hard disk.

It:

Stores your data

Persists even if instance stops

Can be resized

Like adding a hard drive to your PC.

### 4️⃣ Security Groups (Firewall)

Security groups control:

Who can access your server

Which ports are open (like 80 for website, 22 for SSH)

They act like a security guard for your virtual machine.

### Key Pair (Login Method)

Instead of password login, EC2 uses a key pair:

Public key (stored in AWS)

Private key (you keep safe)

You use this to securely log in to your server.

### 🔹 EC2 Pricing (Pay-As-You-Go)

You only pay for what you use.

Main pricing types:

On-Demand – Pay per hour/second

Reserved Instances – Cheaper if you commit long-term

Spot Instances – Very cheap but can be stopped anytime

Savings Plans – Flexible discount plans

No upfront hardware cost.

### 🔹 Why EC2 is Powerful
🚀 Scalability

You can:

Increase server power

Add more servers

Auto-scale based on traffic

If your website gets viral, EC2 can handle it.

🌍 Global Availability

You can launch servers in different regions like:

US

Europe

Asia

This helps reduce latency.

🔒 High Security

Firewall control

Encryption options

IAM permissions

#### 🔹 Example Use Case

Let’s say you want to host a website:

Launch EC2 instance

Install Apache/Nginx

Upload your website code

Open port 80 in security group

Access via public IP

Your website is now live 🌍

### 🔹 Advantages of EC2

✅ No physical hardware
✅ Fast setup (minutes)
✅ Flexible pricing
✅ Highly scalable
✅ Secure
✅ Reliable

### 🔹 Disadvantages

❌ Can be complex for beginners
❌ Costs can increase if not monitored
❌ Requires cloud knowledge

## ✅ 1️⃣ Create EC2 Using AWS CLI (Command Line)

This uses Amazon EC2 from Amazon Web Services.

### Step 1: Configure AWS CLI
aws configure
Enter:

Access Key

Secret Key

Region

Output format

### Step 2: Run EC2 Instance
aws ec2 run-instances \
    --image-id ami-0abcdef1234567890 \
    --count 1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids sg-0123456789abcdef0 \
    --subnet-id subnet-0123456789abcdef0

👉 This command:

Selects OS image

Chooses instance type

Attaches key pair

Adds security group

Launches serverEnter:

Access Key

Secret Key

Region

Output format

Step 2: Run EC2 Instance
aws ec2 run-instances \
    --image-id ami-0abcdef1234567890 \
    --count 1 \
    --instance-type t2.micro \
    --key-name MyKeyPair \
    --security-group-ids sg-0123456789abcdef0 \
    --subnet-id subnet-0123456789abcdef0

👉 This command:

Selects OS image

Chooses instance type

Attaches key pair

Adds security group

Launches server

# Here is a clear and simple step-by-step to launch EC2 in AWS.

We will launch a virtual server using Amazon EC2 in Amazon Web Services.

## ✅ Step 1: Login to AWS

Go to AWS Console

Enter username & password

After login, you’ll see the AWS dashboard

## ✅ Step 2: Open EC2 Service

In the top search bar, type EC2

Click on EC2

You will see the EC2 Dashboard

## ✅ Step 3: Click “Launch Instance”

Click the orange Launch Instance button.

## ✅ Step 4: Configure Your Instance

Now fill in the details:

### 🔹 4.1 Name Your Instance

Example:
My-First-EC2

This is just a label for you.

### 🔹 4.2 Choose AMI (Operating System)

Select an OS like:

Amazon Linux (recommended)

Ubuntu

Windows Server

👉 This is like choosing Windows or Linux for your computer.

### 🔹 4.3 Choose Instance Type

Select:

t2.micro (Free Tier eligible)

This defines:

CPU

RAM

For learning, always choose Free Tier.

### 🔹 4.4 Create or Select Key Pair 🔑

Key pair is used to log in securely.

If new:

Click Create Key Pair

Give it a name

Choose RSA

Download .pem file

⚠️ Keep it safe. You cannot download it again.

### 🔹 4.5 Configure Network & Security Group

Security Group = Firewall.

Allow:

SSH (Port 22) → For login

HTTP (Port 80) → For website

HTTPS (Port 443) → Secure website

For beginners:

Allow SSH from “My IP”

### 🔹 4.6 Configure Storage

Default is 8GB (enough for practice).

You can increase if needed.

## ✅ Step 5: Click “Launch Instance”

Click Launch Instance button.

Wait 1–2 minutes.

Status will change to:

## ✅ Running

## ✅ Step 6: Connect to EC2

Go to Instances

Select your instance

Click Connect

Choose:

EC2 Instance Connect (browser method)
OR

SSH using key file

If using SSH:

ssh -i your-key.pem ec2-user@your-public-ip

Now you are inside your virtual server 🎉

## ✅ Step 7: Stop or Terminate (Very Important)

After practice:

Stop → Temporary shutdown

Terminate → Delete permanently

⚠️ Always terminate if not using to avoid charges.
