terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-data-ingestion"
    key            = "dev/terraform.tfstate"
    region         = "us-east-1"
    profile        = "default"
    encrypt        = true
    dynamodb_table = "terraform-state-lock-table"
  }
}
