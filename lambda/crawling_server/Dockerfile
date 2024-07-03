# FROM lambda_python

# WORKDIR /app
# USER root
# RUN yum update -y
# RUN yum install wget unzip -y 
# RUN wget https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.78/linux64/chrome-linux64.zip
# RUN unzip chrome-linux64.zip
# RUN chmod 777 chrome-linux64/chrome
# RUN wget https://storage.googleapis.com/chrome-for-testing-public/125.0.6422.78/linux64/chromedriver-linux64.zip
# RUN unzip chromedriver-linux64.zip
# RUN chmod 777 chromedriver-linux64/chromedriver

# COPY requirements.txt /app/requirement.txt 
# RUN pip3 install -r /app/requirement.txt

# COPY crawler.py ${LAMBDA_TASK_ROOT}
# CMD ["crawler.lambda_handler"]


FROM umihico/aws-lambda-selenium-python:latest

COPY requirements.txt /app/requirements.txt
RUN pip install -r /app/requirements.txt
RUN pip install requests
RUN pip install beautifulsoup4
COPY crawler.py ./

CMD [ "crawler.lambda_handler" ]