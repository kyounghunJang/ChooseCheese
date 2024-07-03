resource "aws_dynamodb_table" "capstone" {
  name           = "capstone-test"
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "Idx"
  stream_enabled   = true
  stream_view_type = "NEW_IMAGE"
  attribute {
    name = "Idx"
    type = "N"
  }
  tags = {
    Name        = "dynamodb-table-1"
    Environment = "production"
  }
}
resource "aws_dynamodb_table" "cart_list" {
  name="cart_list"
  billing_mode = "PAY_PER_REQUEST"
  hash_key = "username"
  attribute {
    name="username"
    type = "S"
  }
  tags={
    Name = "cart_list"
    Environment = "production"
  
  }
}
resource "aws_db_instance" "capstone_rds" {
  allocated_storage    = 10
  db_name              = "capstone"
  identifier           = "capstone-rds"
  engine               = "mysql"
  engine_version       = "8.0.35"
  instance_class       = "db.t3.micro"
  username             = "admin"
  password             = "qwer1234"
  parameter_group_name = "default.mysql8.0"
  vpc_security_group_ids = [aws_security_group.Capstone_RDS.id]
  skip_final_snapshot  = true
  publicly_accessible  = true
}
resource "aws_vpc_endpoint" "dynamodb_endpoint" {
    vpc_id = "vpc-05a5c8a56ad646544"
    service_name ="com.amazonaws.ap-northeast-2.dynamodb"
    vpc_endpoint_type = "Gateway"
    route_table_ids = ["rtb-07e5abf031771a76b"]
}
resource "aws_efs_file_system" "script_vol" {
  tags = {  
    Name = "script_vol"
  }
}
resource "aws_efs_mount_target" "flink_mount_target" {
  file_system_id = aws_efs_file_system.script_vol.id
  subnet_id      = "subnet-0e3473d2ce33e9587"
}

