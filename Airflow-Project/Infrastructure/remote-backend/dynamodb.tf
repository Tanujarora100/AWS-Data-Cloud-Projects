resource "aws_dynamodb_table" "terraform_locks" {
  name         = "data-ingestion-state-lock"
  billing_mode = "PAY_PER_REQUEST"
  server_side_encryption {
    enabled     = true
    kms_key_arn = aws_kms_key.kms-state-encryption-key.arn
  }
  hash_key = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform-State-Lock-Table"
    Environment = "dev"
  }
  depends_on = [aws_kms_key.kms-state-encryption-key]
}
