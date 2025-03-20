
variable "sqs_queue_name" {
  description = "The name of the SQS queue"
  type        = string
  nullable    = false
  default     = "Ingestion-lambda-dlq"
}
