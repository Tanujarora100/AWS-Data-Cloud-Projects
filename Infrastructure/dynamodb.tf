resource "aws_dynamodb_table" "terraform_locks" {
  name         = "data-ingestion-state-lock"
  billing_mode = "PAY_PER_REQUEST"

  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = {
    Name        = "Terraform-State-Lock-Table"
    Environment = "dev"
  }
}
