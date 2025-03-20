resource "aws_s3_bucket" "source-ingestion-bucket" {
  bucket = local.bucket_name

  force_destroy = true
}
resource "aws_s3_bucket_public_access_block" "ingestion-bucket-public-access-block" {
  bucket              = aws_s3_bucket.source-ingestion-bucket.bucket
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}


resource "aws_s3_bucket_versioning" "data-ingestion-bucket-versioning" {
  bucket = aws_s3_bucket.source-ingestion-bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}