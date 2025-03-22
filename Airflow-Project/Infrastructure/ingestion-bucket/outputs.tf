output "bucket-name" {
  value = aws_s3_bucket.source-ingestion-bucket.id
}
output "bucket-region" {
  value = aws_s3_bucket.source-ingestion-bucket.region
}
output "bucket-arn" {
  value = aws_s3_bucket.source-ingestion-bucket.arn
}
