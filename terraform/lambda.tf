locals {
  lambda_files = {
    "lambda_main" : {
      source_file = "../lambda/lambda_main.py"
      output_path = "./lambda_zips/lambda_main.zip"
    },
    "lambda_main_misoranking" : {
      source_file = "../lambda/lambda_main_misoranking.py"
      output_path = "./lambda_zips/lambda_main_misoranking.zip"
    },
    "lambda_main_misopoint" : {
      source_file = "../lambda/lambda_main_misopoint.py"
      output_path = "./lambda_zips/lambda_main_misopoint.zip"
    },
    "recommend" : {
      source_file = "../lambda/recommend.py"
      output_path = "./lambda_zips/recommend.zip"
    },
    "recommend_posebyperson" : {
      source_file = "../lambda/recommend_posebyperson.py"
      output_path = "./lambda_zips/recommend_posebyperson.zip"
    },
    "recommend_posebytheme" : {
      source_file = "../lambda/recommend_posebytheme.py"
      output_path = "./lambda_zips/recommend_posebytheme.zip"
    }
    "read_cart":{
      source_file = "../lambda/read_cart.py"
      output_path = "./lambda_zips/read_cart.zip"
    }
    "add_cart":{
      source_file = "../lambda/add_cart.py"
      output_path = "./lambda_zips/add_cart.zip"
    }
    "dynamodb_stream":{
      source_file = "../lambda/reading_dynamodb_stream.py"
      output_path = "./lambda_zips/dynamodb_stream.zip"
    }
  }
}
locals {
  lambda_layers={
    "joselayer":{
      filename   = "../lambda/joselayer.zip"
      layer_name = "joselayer"
    }
    "pymysql_layer":{
      filename   = "../lambda/pymysql_layer.zip"
      layer_name = "pymysql_layer"
    }
  }
}
data "archive_file" "lambda" {
  for_each = local.lambda_files
  type        = "zip"
  source_file = each.value.source_file
  output_path = each.value.output_path
}

resource "aws_lambda_layer_version" "lambda_layer" {
  for_each = local.lambda_layers
  filename   = each.value.filename
  layer_name = each.value.layer_name

  compatible_runtimes = ["python3.11"]
}

resource "aws_lambda_function" "lambda" {
  
  for_each = local.lambda_files
  filename      = data.archive_file.lambda[each.key].output_path
  function_name = each.key
  role          = aws_iam_role.iam_for_lambda.arn
  handler       = "${each.key}.lambda_handler"
  source_code_hash = data.archive_file.lambda[each.key].output_base64sha256
  runtime = "python3.11"
  layers = (each.key == "lambda_main_misoranking" ?
  [aws_lambda_layer_version.lambda_layer["joselayer"].arn, aws_lambda_layer_version.lambda_layer["pymysql_layer"].arn] 
  : each.key == "dynamodb_stream"? [aws_lambda_layer_version.lambda_layer["pymysql_layer"].arn]
  :[aws_lambda_layer_version.lambda_layer["joselayer"].arn])

  environment {
    variables = {
      SECRET_KEY = "1f45c681bf9fb2d329d544efeabf346db688be94974338d1e987cdc2ecba9d9f",
      ALGORITHM = "HS256"
      db_user_id       = each.key == "dynamodb_stream" ? "admin" : null
      db_user_password = each.key == "dynamodb_stream" ? "qwer1234" : null
    }
  }
}

data "terraform_remote_state" "MSK_lambda" {
  backend = "local"
  config = {
    path = "./terraform.tfstate"
  }
}

resource "aws_lambda_function" "crawling_lambda" {
  function_name = "crawling-server"
  role          = aws_iam_role.iam_for_lambda.arn
  image_uri     = "260671567414.dkr.ecr.ap-northeast-2.amazonaws.com/capstone-private:lambda_selenium"
  architectures = ["x86_64"]
  package_type = "Image"
  memory_size = 1024
  timeout = 10
  environment {
    variables = {
      SECRET_KEY = "1f45c681bf9fb2d329d544efeabf346db688be94974338d1e987cdc2ecba9d9f"
      ALGORITHM  = "HS256"
      broker_server= data.terraform_remote_state.MSK_lambda.outputs.bootstrap_brokers
    } 
  }
  vpc_config {
    # Every subnet should be able to reach an EFS mount target in the same Availability Zone. Cross-AZ mounts are not permitted.
    subnet_ids         = [aws_subnet.private_subnet_1a.id,aws_subnet.private_subnet_1b.id]
    security_group_ids = [aws_security_group.MSK_security.id]
  }
}

resource "aws_lambda_event_source_mapping" "dynamodb_stream" {
  event_source_arn  = aws_dynamodb_table.capstone.stream_arn
  function_name     = aws_lambda_function.lambda["dynamodb_stream"].arn
  starting_position = "LATEST"
   batch_size       = 1
}