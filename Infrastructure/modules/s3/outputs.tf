output "bucket-name" {
  value = aws_s3_bucket.ingestion_bucket.id
}
output "bucket-region" {
  value = aws_s3_bucket.ingestion_bucket.region
}
output "bucket-arn" {
  value = aws_s3_bucket.ingestion_bucket.arn
}
