resource "aws_api_gateway_rest_api" "Capstone-api" {
  name = "capstone-api"
  description = "capstone-api"

  endpoint_configuration {
    types = ["REGIONAL"]
  }
}
resource "aws_api_gateway_resource" "crawling_server" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id = aws_api_gateway_rest_api.Capstone-api.root_resource_id
  path_part = "crawling_server"
}

resource "aws_api_gateway_method" "crawling_server_post" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.crawling_server.id
  http_method   = "POST"
  authorization = "NONE"
}


resource "aws_api_gateway_integration" "crawling_server_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.crawling_server.id
  http_method = aws_api_gateway_method.crawling_server_post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.crawling_lambda.invoke_arn
}

resource "aws_api_gateway_resource" "main" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id = aws_api_gateway_rest_api.Capstone-api.root_resource_id
  path_part = "main"
}

resource "aws_api_gateway_method" "main_get" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.main.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "main_get_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.main.id
  http_method = aws_api_gateway_method.main_get.http_method

  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["lambda_main"].invoke_arn
}

resource "aws_api_gateway_resource" "main_misopoint" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id = aws_api_gateway_resource.main.id
  path_part = "misopoint"
}

resource "aws_api_gateway_method" "main_misopoint_post" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.main_misopoint.id
  http_method   = "POST"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "main_misopoint_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.main_misopoint.id
  http_method = aws_api_gateway_method.main_misopoint_post.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["lambda_main_misopoint"].invoke_arn
}
resource "aws_api_gateway_resource" "main_misoranking" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id = aws_api_gateway_resource.main.id
  path_part = "misoranking"
}

resource "aws_api_gateway_method" "main_misoranking_get" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.main_misoranking.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "main_misoranking_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.main_misoranking.id
  http_method = aws_api_gateway_method.main_misoranking_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["lambda_main_misoranking"].invoke_arn
}

resource "aws_api_gateway_resource" "recommend" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id = aws_api_gateway_rest_api.Capstone-api.root_resource_id
  path_part = "recommend"
}

resource "aws_api_gateway_method" "recommend_get" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.recommend.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "recommend_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.recommend.id
  http_method = aws_api_gateway_method.recommend_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["recommend"].invoke_arn
}

resource "aws_api_gateway_resource" "recommend_posebyperson" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id   = aws_api_gateway_resource.recommend.id
  path_part   = "posebyperson"
}

resource "aws_api_gateway_resource" "recommend_posebyperson_num" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id   = aws_api_gateway_resource.recommend_posebyperson.id
  path_part   = "{num+}"
}

resource "aws_api_gateway_method" "recommend_posebyperson_num_get" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.recommend_posebyperson_num.id
  http_method   = "GET"
  authorization = "NONE"
}

resource "aws_api_gateway_integration" "recommend_posebyperson_num_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.recommend_posebyperson_num.id
  http_method = aws_api_gateway_method.recommend_posebyperson_num_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["recommend_posebyperson"].invoke_arn
}

resource "aws_api_gateway_resource" "recommend_posebytheme" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id   = aws_api_gateway_resource.recommend.id
  path_part   = "posebytheme"
}

resource "aws_api_gateway_method" "recommend_posebytheme_get" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.recommend_posebytheme.id
  http_method   = "GET"
  authorization = "NONE"
}
resource "aws_api_gateway_integration" "recommend_posebytheme_lambda" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.recommend_posebytheme.id
  http_method = aws_api_gateway_method.recommend_posebytheme_get.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["recommend_posebytheme"].invoke_arn
}

resource "aws_api_gateway_resource" "cart" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  parent_id   = aws_api_gateway_resource.recommend.id
  path_part   = "cart"
}
resource "aws_api_gateway_method" "read_cart" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.cart.id
  http_method   = "GET"
  authorization = "NONE"
  request_parameters = {"method.request.header.Authorization" = true}
}
resource "aws_api_gateway_method" "add_cart" {
  rest_api_id   = aws_api_gateway_rest_api.Capstone-api.id
  resource_id   = aws_api_gateway_resource.cart.id
  http_method   = "POST"
  authorization = "NONE"
  request_parameters = {"method.request.header.Authorization" = true}
}
resource "aws_api_gateway_integration" "read_cart" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.cart.id
  http_method = aws_api_gateway_method.read_cart.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["read_cart"].invoke_arn
}
resource "aws_api_gateway_integration" "add_cart" {
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  resource_id = aws_api_gateway_resource.cart.id
  http_method = aws_api_gateway_method.add_cart.http_method
  integration_http_method = "POST"
  type                    = "AWS_PROXY"
  uri                     = aws_lambda_function.lambda["add_cart"].invoke_arn
}

resource "aws_lambda_permission" "apigw_lambda" {
  for_each = aws_lambda_function.lambda

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = each.value.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.Capstone-api.execution_arn}/*"
}
resource "aws_lambda_permission" "apigw_lambda_cralwer" {

  statement_id  = "AllowExecutionFromAPIGateway"
  action        = "lambda:InvokeFunction"
  function_name = aws_lambda_function.crawling_lambda.function_name
  principal     = "apigateway.amazonaws.com"
  source_arn = "${aws_api_gateway_rest_api.Capstone-api.execution_arn}/*"
}


resource "aws_api_gateway_deployment" "deployment" {
  # depends_on = [aws_api_gateway_integration.integration]
  rest_api_id = aws_api_gateway_rest_api.Capstone-api.id
  stage_name  = "prod"
}
