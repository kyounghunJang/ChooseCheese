from selenium import webdriver
from selenium.webdriver.common.by import By
from jose import JWTError, jwt
import json
import os
from confluent_kafka import Producer
import time
from urllib import request
import base64
from tempfile import mkdtemp
import requests
from bs4 import BeautifulSoup
from urllib.parse import urljoin
SECRET_KEY = os.getenv('SECRET_KEY')
ALGORITHM = os.getenv('ALGORITHM')
broker_servers=os.getenv('broker_servers')

def test(event=None, context=None):
    options = webdriver.ChromeOptions()
    service = webdriver.ChromeService("/opt/chromedriver")
    options.binary_location = '/opt/chrome/chrome'
    options.add_argument("--headless=new")
    options.add_argument('--no-sandbox')
    options.add_argument("--disable-gpu")
    options.add_argument("--window-size=1280x1696")
    options.add_argument("--single-process")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--disable-dev-tools")
    options.add_argument("--no-zygote")
    options.add_argument(f"--user-data-dir={mkdtemp()}")
    options.add_argument(f"--data-path={mkdtemp()}")
    options.add_argument(f"--disk-cache-dir={mkdtemp()}")
    options.add_argument("--remote-debugging-port=9222")
    chrome = webdriver.Chrome(options=options, service=service)
    chrome.get("https://example.com/")
    return chrome.find_element(by=By.XPATH, value="//html").text

def lambda_handler(event, context):
    conf = {'bootstrap.servers': '	b-1.capstone.mr5c32.c2.kafka.ap-northeast-2.amazonaws.com'
            ,'message.max.bytes': 20971520}

    jwt_code = event['headers']['Authorization']
    token = jwt_code.split(" ")[1]
    producer = Producer(conf)
    dic={}
    try:
        decoded = jwt.decode(token, SECRET_KEY, algorithms=[ALGORITHM])
        dic['username'] = decoded['sub']
        json_string = event['body']
        data = json.loads(json_string)
        response = requests.get(data['qrImageUrl'])
        soup=BeautifulSoup(response.text,'html.parser')
        tag = soup.find('a', {'id': 'image_download'})
        image_url = tag['href']
        base_url = 'https://release-renewal-s3.s3.ap-northeast-2.amazonaws.com/QRimage/20240610/445/3f26b2d0-123a-4d76-b8af-dfa10cfb1bce/index.html'
        image_url = urljoin(base_url, image_url)
        image=requests.get(image_url)
        encoded_content = base64.b64encode(image.content).decode('utf-8')
        dic['image_bytes']=encoded_content
        producer.produce('test',value=json.dumps(dic))
        producer.flush()
        return {
            'statusCode': 200,
            'body': json.dumps(dic)  # JSON 직렬화를 추가했습니다.
        }
    except JWTError as e:
        print("JWTError:", str(e))
        return {
            'statusCode': 401,
            'body': 'Unauthorized: Token verification failed'
        }
