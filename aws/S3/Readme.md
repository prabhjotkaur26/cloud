# What is S3?

Amazon S3 (Simple Storage Service) is a cloud storage service provided by
Amazon Web Services.

Think of S3 like Google Drive in the cloud for developers, but much more powerful and scalable.

### It lets you:

Store files

Retrieve files

Back up data

Host static websites

Store images/videos for apps

Build data lakes

### 🧠 First Understand This Simple Concept

S3 has only 3 main things:

Term	Simple Meaning
Bucket	Folder
Object	File
Key	File path
## Real Life Example

Imagine you create:

Bucket: my-photo-app

Inside it, you upload:

photos/profile/john.png

Here:

my-photo-app → Bucket

john.png → Object

photos/profile/john.png → Key

That’s it. That’s S3 structure.

### Example Scenario (Real World)
🎯 Problem:

You are building a social media app.

Users upload:

Profile pictures

Posts images

Videos

You cannot store these on your local server because:

Storage will fill up

Not scalable

Risk of data loss

✅ Solution:

Store all media files in S3

Your app:

Uploads image to S3

Saves S3 file URL in database

Displays image using that URL

### 🔐 How S3 Stores Data Safely

S3:

Copies your file into multiple data centers

Provides 99.999999999% durability (11 9’s)

Automatically handles failures

You don’t manage servers.
AWS handles everything.

## Basic Operations in S3

S3 works with HTTP requests:

Operation	What It Does

PUT	-      Upload file

GET -    	Download file

DELETE - 	Remove file

LIST -	   Show files

## Basic Structure of S3

S3 has only 3 main components:

### 1️⃣ Bucket

Top-level container (like folder)

Example:

my-social-app
### 2️⃣ Object

The actual file

Example:

profile.jpg
video.mp4
resume.pdf
### 3️⃣ Key

The full path of file inside bucket

Example:

users/123/profile.jpg
posts/2026/image1.png
## 🔐 Why S3 Is Powerful

S3 provides:

✅ 99.999999999% durability (11 nines)
✅ Automatic backup across multiple data centers
✅ Encryption support
✅ Unlimited storage
✅ Pay only for what you use

### 📍 Where S3 Is Used in Real Applications

S3 is used for:

Image storage for websites

Video streaming storage

Application backups

Data lakes

Log storage

Static website hosting

## For example, S3 works with:

Amazon EC2 (backend servers)

Amazon Lambda (serverless functions)

Amazon CloudFront (CDN)



We use boto3 (AWS SDK for Python).

🔹 Step 1: Install boto3
pip install boto3
🔹 Step 2: Upload File to S3
Example Scenario:

User uploads profile picture → You store it in S3.
import boto3

# Create S3 client
s3 = boto3.client(
    's3',
    aws_access_key_id='YOUR_ACCESS_KEY',
    aws_secret_access_key='YOUR_SECRET_KEY',
    region_name='us-east-1'
)

# Upload file
s3.upload_file(
    'profile.jpg',          # Local file
    'my-social-app',        # Bucket name
    'users/101/profile.jpg' # Key
)

print("File uploaded successfully!")
What happens here:

profile.jpg → local file

Uploaded to bucket → my-social-app

Stored inside path → users/101/profile.jpg

🔹 Step 3: Download File from S3
s3.download_file(
    'my-social-app',
    'users/101/profile.jpg',
    'downloaded_profile.jpg'
)

print("File downloaded successfully!")
🔹 Step 4: Generate a Public URL (For App Display)

If object is public:

file_url = "https://my-social-app.s3.amazonaws.com/users/101/profile.jpg"
print(file_url)

You store this URL in database and show it in frontend.

🔹 Step 5: Delete File (If User Deletes Account)
s3.delete_object(
    Bucket='my-social-app',
    Key='users/101/profile.jpg'
)

print("File deleted successfully!")


