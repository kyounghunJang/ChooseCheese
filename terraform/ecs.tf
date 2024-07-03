provider "aws" {
  alias  = "us_east_1"
  region = "us-east-1"
}
data "terraform_remote_state" "MSK" {
  backend = "local"
  config = {
    path = "./terraform.tfstate"
  }
}
resource "aws_ecs_cluster" "Capstone" {
  name = "Capstone"
  setting {
    name  = "containerInsights"
    value = "enabled"
  }
}

resource "aws_ecs_task_definition" "Capstone_flink" {
  family = "capstone_flink"
  execution_role_arn = aws_iam_role.ecs_task_execution_role.arn
  task_role_arn = aws_iam_role.ecs_task_execution_role.arn
  requires_compatibilities = ["FARGATE"]
  network_mode             = "awsvpc"
  cpu                      = 4096
  memory                   = 10240
  
  depends_on = [aws_msk_cluster.capstone_msk_cluster,data.terraform_remote_state.MSK] 
  container_definitions = jsonencode([
    {
      name      = "JobManager"
      image     = "public.ecr.aws/w8u1w1f3/capstone:pyflink"
      cpu       = 2048
      memory    = 6144
      essential = true
      command = ["jobmanager"]
      Environment = [
      {
        name = "broker_server"
        value = aws_msk_cluster.capstone_msk_cluster.bootstrap_brokers
      },
      {
        name="JAVA_HOME"
        value="/usr/lib/jvm/java-11-openjdk-amd64"
        }]
      portMappings = [
        {
          containerPort = 8081
          hostPort      = 8081
        }
      ]
    },
    {
      name      = "KAFKA-UI"
      image     = "public.ecr.aws/provectus/kafka-ui-custom-build:4083"
      cpu       = 1024
      memory    = 4096
      # essential = true
      portMappings = [
        {
          containerPort = 8080
          hostPort      = 8080
        }
      ]
      environment = [
        {
          name ="KAFKA_CLUSTERS_0_NAME"
          value = "MSK"
        },
        {
          name="KAFKA_CLUSTERS_0_BOOTSTRAPSERVERS"
          value= aws_msk_cluster.capstone_msk_cluster.bootstrap_brokers
        }
      ]
    }
  ]) 
}

resource "aws_ecs_service" "Flink" {
  name            = "flink"
  cluster         = aws_ecs_cluster.Capstone.id
  task_definition = aws_ecs_task_definition.Capstone_flink.arn
  desired_count   = 1
  launch_type     = "FARGATE"
  enable_execute_command = true
  network_configuration {
    subnets         = [aws_subnet.public_subnet_1a.id,aws_subnet.public_subnet_1b.id,aws_subnet.private_subnet_1a.id,aws_subnet.private_subnet_1b.id]
    security_groups = [aws_security_group.Flink.id]
    assign_public_ip = true
  }
}