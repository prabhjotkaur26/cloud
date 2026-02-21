import boto3
from botocore.exceptions import ClientError

# Connect to DynamoDB
dynamodb = boto3.resource('dynamodb', region_name='ap-south-1')
table_name = "prabh"

# --------- CREATE TABLE IF NOT EXISTS ----------
try:
    table = dynamodb.Table(prabh)
    table.load()
    print("Table already exists.")
except ClientError as e:
    if e.response['Error']['Code'] == 'ResourceNotFoundException':
        print("Creating table...")

        table = dynamodb.create_table(
            TableName=table_name,
            KeySchema=[
                {'AttributeName': 'class', 'KeyType': 'RANGE'}     # Sort key
            ],
            AttributeDefinitions=[
                {'AttributeName': 'class', 'AttributeType': 'S'}
            ],
            BillingMode='PAY_PER_REQUEST'
        )

        table.wait_until_exists()
        print("Table created successfully!")
    else:
        raise

# Use table reference
table = dynamodb.Table(prabh)

# --------- INSERT USER INPUT DATA ----------
print("\nEnter details for 5 students:\n")

for i in range(5):
    print(f"Enter Student {i+1} Details")

    name = input("Enter Name: ")
    student_class = input("Enter Class: ")
    age = int(input("Enter Age: "))
    city = input("Enter City: ")

    table.put_item(
        Item={
            'class': student_class,
            'students': name,
            'age': age,
            'city': city
        }
    )

    print("Student added successfully!\n")

print("All 5 records inserted successfully!")