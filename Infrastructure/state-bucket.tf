resource "aws_s3_bucket" "state-bucket" {
  bucket = "terraform-state-bucket-data-ingestion"
  force_destroy = false
}
resource "aws_s3_bucket_public_access_block" "state-bucket-public-access-block" {
  bucket              = aws_s3_bucket.state-bucket.bucket
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}
resource "aws_s3_bucket_versioning" "state-bucket-versioning" {
  bucket = aws_s3_bucket.state-bucket.bucket
  versioning_configuration {
    status = "Enabled"
  }
}
resource "aws_s3_bucket_object" "state-folder"{
    bucket = aws_s3_bucket.state-bucket.id
    key = "Project/"
}