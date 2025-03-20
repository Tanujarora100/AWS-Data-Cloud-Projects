# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-bucket-data-ingestion"    
#     key            = "Project/terraform.tfstate"   
#     region         = "ap-south-1"
#     dynamodb_table = "data-ingestion-state-lock"
#     encrypt        = true
#   }
# }
