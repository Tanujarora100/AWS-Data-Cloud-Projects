output "sqs_queue_name" {
  description = "The name of the SQS queue"
  value       = module.sqs.sqs_queue_name
}
output "sqs-arn" {
  description = "The ARN of the SQS queue"
  value       = module.sqs.sqs_queue_arn
}
output "sqs-url" {
  description = "The URL of the SQS queue"
  value       = module.sqs.sqs_queue_url
}
output "sqs-timeout" {
  description = "The owner of the SQS queue"
  value       = module.sqs.sqs_queue_timeout
}
