resource "aws_s3_bucket" "ingestion-bucket" {
  bucket = var.workspace.bucket_name
  tags = {
    Name = var.workspace.bucket_name
  }
}
resource "aws_s3_bucket_public_access_block" "ingestion-bucket-public-access-block" {
  bucket              = aws_s3_bucket.ingestion-bucket.bucket
  block_public_acls   = true
  block_public_policy = true
  ignore_public_acls  = true
}


resource "aws_s3_bucket_versioning" "data-ingestion-bucket-versioning" {
  bucket = aws_s3_bucket.data-ingestion-bucket-versioning.id
  versioning_configuration {
    status = "Enabled"
  }
}