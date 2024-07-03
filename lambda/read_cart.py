import json
from jose import jwt, JWTError
import boto3
import os

SECRET_KEY = os.getenv('SECRET_KEY')
ALGORITHM = os.getenv('ALGORITHM')
dynamodb = boto3.client('dynamodb')

def id_check(username):
    response = dynamodb.get_item(
        TableName='cart_list',
        Key={
            'username': {'S': username}
        }
    )
    if 'Item' in response:
        print("Found item:", response['Item'])
        return True
    else:
        print("No item found for username:", username)
        return False

def lambda_handler(event, context):
    jwt_code = event['headers']['Authorization']
    token = jwt_code.split(" ")[1]  
    try:
        decoded = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        username = decoded['sub']
        if not id_check(username):
            return {
                'statusCode': 404,
                'body': json.dumps({'message': 'No such user found'})
            }
        response = dynamodb.get_item(
            TableName = 'cart_list',
            Key = {
                'username': {'S': username}
            }
        )
        item = response['Item']
        result  = {
            'cart_items':item['cart']['SS']
        }        
        return {
            'statusCode': 200,
            'body': json.dumps(result)
        }
    except JWTError as e:
        print("JWTError:", str(e))
        return {
            'statusCode': 401,
            'body': 'Unauthorized: Token verification failed'
        }
        