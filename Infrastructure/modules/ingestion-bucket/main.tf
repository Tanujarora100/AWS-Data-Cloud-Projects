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

resource "aws_s3_bucket_server_side_encryption_configuration" "ingestion-bucket-server-side-encryption-configuration" {
    bucket = aws_s3_bucket.source-ingestion-bucket.id

    rule {
        apply_server_side_encryption_by_default {
            kms_master_key_id = "arn:aws:kms:${data.aws_caller_identity.current.account_id}:key/916d25d9-4d3f-4b34-a69a-8080c176c5fb"
            sse_algorithm     = "aws:kms"
        }
    }
}

data "aws_caller_identity" "current" {}