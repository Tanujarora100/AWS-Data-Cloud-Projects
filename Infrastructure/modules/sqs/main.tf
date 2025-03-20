module "commonconfig" {
  source = "../commonconfig"
}
module "lambda" {
  source = "../lambda"
}
resource "aws_sqs_queue" "lambda-dlq" {
  name                      = var.sqs_queue_name
  delay_seconds             = 0
  message_retention_seconds = 86400

  tags = {
    Environment = "dev"
    owner       = module.commonconfig.owner
  }
  depends_on = [
    module.lambda.lambda_function_arn
  ]
}