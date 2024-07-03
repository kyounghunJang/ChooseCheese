resource "aws_security_group" "Capstone_RDS" {
  vpc_id = "vpc-05a5c8a56ad646544"     #생성할 위치의 VPC ID
  name = "Capstone_RDS"                #그룹 이름
  description = "Terraform WEB SG"    #설명
  ingress {
    from_port = 22                    #인바운드 시작 포트
    to_port = 22                      #인바운드 끝나는 포트
    protocol = "tcp"                  #사용할 프로토콜
    cidr_blocks = ["0.0.0.0/0"]       #허용할 IP 범위
}
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
 ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_security_group" "MSK_security" {
  vpc_id = aws_vpc.capstone_vpc.id
  name = "MSK-security"
  description = "MSK SG" 
    ingress {
    from_port = 22                    #인바운드 시작 포트
    to_port = 22                      #인바운드 끝나는 포트
    protocol = "tcp"                  #사용할 프로토콜
    cidr_blocks = ["0.0.0.0/0"]       #허용할 IP 범위
}
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
 ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 9092
    to_port     = 9092
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
resource "aws_security_group" "Flink" {
  vpc_id = aws_vpc.capstone_vpc.id    #생성할 위치의 VPC ID
  name = "Flink"                        #그룹 이름
  description = "Terraform WEB SG"    #설명
  ingress {
    from_port = 22                    #인바운드 시작 포트
    to_port = 22                      #인바운드 끝나는 포트
    protocol = "tcp"                  #사용할 프로토콜
    cidr_blocks = ["0.0.0.0/0"]       #허용할 IP 범위
}
  ingress {
    from_port = 80
    to_port = 80
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
 ingress {
    from_port = 443
    to_port = 443
    protocol = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
}
  egress {
    from_port       = 0
    to_port         = 0
    protocol        = "-1"
    cidr_blocks     = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 8081
    to_port     = 8081
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}