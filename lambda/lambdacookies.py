import json
from cryptography.fernet import Fernet
import pytz
from datetime import datetime


def lambda_handler(event, context):
    return {"statusCode": 200, "body": json.dumps("Hello from Lambda!")}
