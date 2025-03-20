resource "aws_s3_bucket_lifecycle_configuration" "ingestion-bucket-lifecycle-glacier" {
  bucket = aws_s3_bucket.ingestion-bucket.id

  rule {
    id     = "ArchiveAfter90Days"
    status = "Enabled"

    transition {
      days          = 90
      storage_class = "GLACIER"
    }
  }
}
resource "aws_s3_bucket_lifecycle_configuration" "ingestion-bucket-lifecycle-cleanup" {
  bucket = aws_s3_bucket.ingestion-bucket.id

  rule {
    id     = "DeleteAfter365Days"
    status = "Enabled"

    expiration {
      days = 365
    }
  }

  rule {
    id     = "ExpireNonCurrentObjectsImmediately"
    status = "Enabled"

    noncurrent_version_expiration {
      noncurrent_days = 0
    }
  }
}