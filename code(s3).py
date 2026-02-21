import boto3
from botocore.exceptions import ClientError

dynamodb = boto3.resource('dynamodb', region_name='ap-south-1')
table_name = "prabh"

try:
    table = dynamodb.Table(table_name)
    table.load()
    print("Table already exists.")
except ClientError as e:
    if e.response['Error']['Code'] == 'ResourceNotFoundException':
        print("Creating table...")

        table = dynamodb.create_table(
            TableName=table_name,
            KeySchema=[
                {'AttributeName': 'user_id', 'KeyType': 'HASH'},   # Partition key
                                         {'AttributeName': 'student_class', 'KeyType': 'RANGE'} # Sort key, optional
            ],
            AttributeDefinitions=[
                {'AttributeName': 'user_id', 'AttributeType': 'S'},
                {'AttributeName': 'student_class', 'AttributeType': 'S'}
            ],
            BillingMode='PAY_PER_REQUEST'
        )

        table.wait_until_exists()
        print("Table created successfully!")
    else:
        raise

response = table.update_item(
    Key={
        'students': 'abc'
    },
    UpdateExpression="SET age = :age, city = :city",
    ExpressionAttributeValues={
        ':age': 30,
        ':city': 'New York'
    },
    ReturnValues="UPDATED_NEW"
)

print("Updated attributes:", response['Attributes'])

response = table.delete_item(
    Key={
        'students': 'xyz'  # Replace with your item's primary key
    }
)

print("DeleteItem succeeded:", response)
