# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-bucket-data-ingestion"
#     key            = "Project/terraform.tfstate"
#     region         = "us-east-1"
#     encrypt        = true
#     dynamodb_table = "data-ingestion-state-lock"
#   }
# }
