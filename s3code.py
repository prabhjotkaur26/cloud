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
