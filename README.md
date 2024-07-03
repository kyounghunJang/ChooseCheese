# ChooseCheese

<div align = "center">
<img width="720" alt="추즈치즈" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/781ea7da-bc66-4cc7-b6ab-d56fba582d92">


# 🧀 Choose Cheese

**ChooseCheese는 사용자의 네컷사진 관리 및 포즈 분석/추천, 미소기부 서비스 입니다.**

**기존 네컷사진 관리의 어려움을 개선하고자 하는 아이디어에서 시작되었습니다.**

</div>

- 기존 네컷 사진 관리의 어려움을 해결하기 위해, 네컷 사진에 포함된 QR 코드를 촬영하는 것만으로 사진을 저장하고 관리할 수 있도록 단순화하였습니다. 또한, 사진에 등장한 얼굴을 통해 사진을 클러스터링하는 기능으로 사용성을 개선하였습니다.
- 사용자가 업로드한 네컷 사진의 포즈와 분위기를 분석하여, 사용자가 경험해보지 못한 새로운 사진 포즈와 분위기를 추천하는 기능을 제공합니다.
- 네컷 사진에 등장한 인물의 미소 점수를 측정하여, 미소 점수에 따른 기부를 진행하는 기능도 포함하고 있어,사용자 참여를 높이고 사회적 기여를 장려합니다.

<p align="center">
  🎬 발표영상 : <a href="https://youtu.be/0kTT6WnuCr4?t=0s">Youtube</a>
</p>

## 📌 핵심기능

### 자동화된 사진 업로드, 네컷사진 관리, 인물 클러스터링

사용자는 네컷사진의 QR코드를 촬영하여 자동으로 사진을 저장할 수 있습니다. 사진은 메인화면에 업로드 되며, 상단의 인물 얼굴 아이콘을 통하여 특정 사람과 함께 찍은 사진을 빠르고 쉽게 찾아볼 수 있게 되었습니다. 이러한 기능을 통해 사진 정리와 관리가 훨씬 수월해지게 되었습니다.

<div align = "center">
  <img width="200" alt="스크린샷 2024-07-03 오후 3 59 09" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/ae0ec4ab-1d10-474d-844c-7481e974f5cc">
  <img width="200" alt="스크린샷 2024-07-03 오후 3 59 20" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/888e9192-228c-4475-8a76-9c53123f7b04">
  <img width="200" alt="스크린샷 2024-07-03 오후 3 59 30" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/b4b785c5-dc8e-4132-959f-2b522b697c56">
</div>

## 🏙️ 시스템 아키텍처
<div align = "center">
  <img width="998" alt="그림1" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/4d04120d-8e9a-4b23-846a-e8b201a47034">
</div>

## ⚒️ 프레임워크

| 구분                      | 기술스텍                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Frontend                  | <img src="https://img.shields.io/badge/android-34A853?style=for-the-badge&logo=android&logoColor=white">                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Backend                   | <img src="https://img.shields.io/badge/fastapi-009688?style=for-the-badge&logo=fastapi&logoColor=white"> <img src="https://img.shields.io/badge/AWS Lambda-FF9900?style=for-the-badge&logo=awslambda&logoColor=white"> <img src="https://img.shields.io/badge/AWS Api Gateway-FF4F8B?style=for-the-badge&logo=amazonapigateway&logoColor=white">                                                                                                                                                                                             |
| DB                        | <img src="https://img.shields.io/badge/Mysql-4479A1?style=for-the-badge&logo=Mysql&logoColor=white"> <img src="https://img.shields.io/badge/Aws Rds-527FFF?style=for-the-badge&logo=amazonrds&logoColor=white"> <img src="https://img.shields.io/badge/AWS Dynamodb-4053D6?style=for-the-badge&logo=amazondynamodb&logoColor=white">                                                                                                                                                                                                         |
| Data Enginnering          | <img src="https://img.shields.io/badge/AWS selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white"> <img src="https://img.shields.io/badge/AWS Kafka-231F20?style=for-the-badge&logo=apachekafka&logoColor=white"> <img src="https://img.shields.io/badge/apache flink-E6526F?style=for-the-badge&logo=apacheflink&logoColor=white"> <img src="https://img.shields.io/badge/kafka_ui-231F20?style=for-the-badge&logo=kafka&logoColor=white">                                                                                      |
| AI                        | <img src="https://img.shields.io/badge/pytorch-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white"> <img src="https://img.shields.io/badge/AWs rekognition-569A31?style=for-the-badge&logo=&logoColor=white"> <img src="https://img.shields.io/badge/Openai-412991?style=for-the-badge&logo=Openai&logoColor=white">                                                                                                                                                                                                                    |
| Project Management& Infra | <img src="https://img.shields.io/badge/amazon ecs-FF9900?style=for-the-badge&logo=amazonecs&logoColor=white"> <img src="https://img.shields.io/badge/terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white"> <img src="https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazon&logoColor=white"> |


## 🙋‍♂️ ChooseCheese 소개
ChooseCheese는 Android 1명 & BE 1명 & Data Engineeering & infra 1명 & AI 1명 으로 구성되어 있습니다. 
