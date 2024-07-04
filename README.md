# 🧀 ChooseCheese

<div align = "center">
<img width="720" alt="추즈치즈" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/781ea7da-bc66-4cc7-b6ab-d56fba582d92">

# Choose Cheese !
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

### 미소 점수, 미소 점수 랭킹, 미소 기부

사용자가 업로드한 사진을 클릭하여서 사진에서 미소가 탐지된 얼굴과 측정된 미소 점수를 확인할 수 있습니다. 또한 사용자간의 긍정적인 경쟁심리를 일으킬 수 있는 미소 점수 랭킹을 도입하여서 사용자들이 더 많은 미소를 띄게끔 유도합니다. 미소 점수 랭킹은 사용자의 미소 점수에 따라서 기부금이 쌓이게 되며, 이 기부금은 사용자가 선택한 비영리 단체에 기부됩니다.

<div align = "center">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 50 51" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/8e0ffb96-38ea-4c5c-b2bf-3f77fa7014aa">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 51 03" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/0cfbfb93-405d-4180-86b5-c4fb84813e8a">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 51 12" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/1c7a8cb9-ea10-49c9-9334-8194e0274cde">
</div>


### 포즈/분위기 분석, 분석 결과 기반 랜덤 추천, AnimeGANv3를 통한 비식별처리

사용자가 업로드한 사진의 포즈와 분위기를 분석하여, 사용자가 경험해보지 못한 새로운 사진 포즈와 분위기를 추천하는 기능을 제공합니다. 또한, 사용자가 업로드한 사진을 AnimeGANv3를 통하여 비식별처리를 진행하여, 사용자의 개인정보를 보호합니다. 모든 추천 이미지는 비식별화처리되어 프라이버시를 보호하면서도 사용자에게 풍부하고 개성있는 시각 자료를 제공합니다. 

<div align = "center">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 51 42" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/461f2f0f-14fa-41b7-a4fa-6f1f4dd5d10f">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 51 55" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/ebf07e3f-de3e-467c-bd77-ce92d9c0979f">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 52 08" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/a47483b4-7d77-4aad-9315-c5c4699cad36">
  <img width="200" alt="스크린샷 2024-07-04 오후 2 52 18" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/d4ddaf2c-1831-4a2b-a57f-eecfc5d90047">
</div>

## ☕️ 기술적 도전
### 서버리스 백엔드 구축
- **비용 최적화** : AWS환경에서의 서버유지비용 문제가 있었습니다.  API Gateway + Lambda를 활용한 서버리스 백엔드 구축으로 비용 최적화를 달성하였습니다.
- **항상 사용 가능한 백엔드** : 서버 유지비용 문제가 해결되어 백엔드 서버를 계속하여 실행상태로 유지할 수 있게 되었습니다. 따라서 프론트엔드 파트 팀원이 항상 API 통신 테스트를 할 수 있게 되었습니다.

### JWT 토큰을 활용한 사용자 인증체계 구축
- **로그인 로직** : 로그인 및 JWT토큰 발급을 위해 FastAPI를 활용하여 인증과 인가를 구현하였습니다.
- **무상태 인증** : JWT 토큰을 활용하여 서버에 상태를 저장할 필요 없이 클라이언트 측에서 인증 정보를 유지할 수 있도록 구현하였습니다. 이는 상태를 유지하지 않는 서버리스 아키텍처에 적합하며, 각 Lambda 함수들이 요청을 독립적으로 처리할 수 있게 하였습니다.
- **보안성 강화**: Lambda에 요청이 들어올 시 JWT 토큰의 만료 기간을 확인하고, 만료된 토큰이 들어오면 해당 요청을 거부합니다. 또한, JWT 토큰이 발급될 때의 서명과 일치하지 않는 경우 요청을 처리하지 않도록 구현하여 보안성을 강화하였습니다. 이를 통해 각 요청이 신뢰할 수 있는 상태에서만 처리되도록 보장합니다.

## 💻 이슈 해결 기록
### FE

### BE

### DE / Infra

### AI

## 🏙️ 시스템 아키텍처
<div align = "center">
  <img width="998" alt="그림1" src="https://github.com/kyounghunJang/ChooseCheese/assets/97864850/4d04120d-8e9a-4b23-846a-e8b201a47034">
</div>

## ⚒️ 프레임워크

| 구분                      | 기술스택                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                    |
| ------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Frontend                  | <img src="https://img.shields.io/badge/android-34A853?style=for-the-badge&logo=android&logoColor=white">                                                                                                                                                                                                                                                                                                                                                                                                                                     |
| Backend                   | <img src="https://img.shields.io/badge/fastapi-009688?style=for-the-badge&logo=fastapi&logoColor=white"> <img src="https://img.shields.io/badge/AWS Lambda-FF9900?style=for-the-badge&logo=awslambda&logoColor=white"> <img src="https://img.shields.io/badge/AWS Api Gateway-FF4F8B?style=for-the-badge&logo=amazonapigateway&logoColor=white">                                                                                                                                                                                             |
| DB                        | <img src="https://img.shields.io/badge/Mysql-4479A1?style=for-the-badge&logo=Mysql&logoColor=white"> <img src="https://img.shields.io/badge/Aws Rds-527FFF?style=for-the-badge&logo=amazonrds&logoColor=white"> <img src="https://img.shields.io/badge/AWS Dynamodb-4053D6?style=for-the-badge&logo=amazondynamodb&logoColor=white">                                                                                                                                                                                                         |
| Data Enginnering          | <img src="https://img.shields.io/badge/selenium-43B02A?style=for-the-badge&logo=selenium&logoColor=white"> <img src="https://img.shields.io/badge/Apache Kafka-231F20?style=for-the-badge&logo=apachekafka&logoColor=white"> <img src="https://img.shields.io/badge/apache flink-E6526F?style=for-the-badge&logo=apacheflink&logoColor=white"> <img src="https://img.shields.io/badge/ui for apache kafka-231F20?style=for-the-badge&logo=kafka&logoColor=white">                                                                                      |
| AI                        | <img src="https://img.shields.io/badge/pytorch-EE4C2C?style=for-the-badge&logo=pytorch&logoColor=white"> <img src="https://img.shields.io/badge/AWs rekognition-569A31?style=for-the-badge&logo=&logoColor=white"> <img src="https://img.shields.io/badge/Openai-412991?style=for-the-badge&logo=Openai&logoColor=white">                                                                                                                                                                                                                    |
| Project Management& Infra | <img src="https://img.shields.io/badge/amazon ecs-FF9900?style=for-the-badge&logo=amazonecs&logoColor=white"> <img src="https://img.shields.io/badge/terraform-844FBA?style=for-the-badge&logo=terraform&logoColor=white"> <img src="https://img.shields.io/badge/docker-2496ED?style=for-the-badge&logo=docker&logoColor=white"> <img src="https://img.shields.io/badge/github-181717?style=for-the-badge&logo=github&logoColor=white"> <img src="https://img.shields.io/badge/AWS-FF9900?style=for-the-badge&logo=amazon&logoColor=white"> |

🧐 <a href="">기술스택 선정 이유</a>

## 🙋‍♂️ ChooseCheese 소개
ChooseCheese는 Android 1명 & BE 1명 & Data Engineeering & infra 1명 & AI 1명 으로 구성되어 있습니다 ✌️

| 이름   | 파트     | Github                                                       |
| ------ | -------- | ------------------------------------------------------------ |
| 서관우 | Android  |                                                              |
| 이재찬 | AI       |
| 장경훈 | DE / AWS | <a href="https://github.com/kyounghunJang">kyounghunJang</a> |
| 최성민 | BE / AWS | <a href="https://github.com/choismne">choismne</a>           |
