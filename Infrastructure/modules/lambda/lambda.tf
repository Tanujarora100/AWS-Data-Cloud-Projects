
module "sqs" {
  source = "../sqs"
}
data "archive_file" "lambda" {
  type        = "zip"
  source_file = "${path.module}/code/code.py"
  output_path = "${path.module}/code/.artifacts/lambda_function_payload.zip"
}

resource "aws_lambda_function" "data-ingestion-lambda" {
  filename      = data.archive_file.lambda.output_path
  function_name = var.lambda-name
  role          = aws_iam_role.data-ingestion-lambda-role.arn
  handler       = "code.handler"
  runtime       = "python3.11"
  timeout       = 300
  dead_letter_config {
    target_arn = aws_sqs_queue.dlq.arn
  }
  depends_on = [
    aws_iam_role.data-ingestion-lambda-role
  ]
}