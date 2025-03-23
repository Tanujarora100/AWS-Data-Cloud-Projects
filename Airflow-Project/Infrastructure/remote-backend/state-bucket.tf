resource "aws_s3_bucket" "state-bucket" {
  bucket        = "terraform-state-bucket-data-ingestion"
  force_destroy = false

  depends_on = [aws_kms_alias.state-kms-alias]
}
resource "aws_s3_bucket_server_side_encryption_configuration" "state-bucket-server-side-encryption-configuration" {
  bucket = aws_s3_bucket.state-bucket.id

  rule {
    apply_server_side_encryption_by_default {
      kms_master_key_id = aws_kms_key.kms-state-encryption-key.arn
      sse_algorithm     = "aws:kms"
    }
  }
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
resource "aws_s3_object" "state-folder" {
  bucket = aws_s3_bucket.state-bucket.id
  key    = "Project/"
}