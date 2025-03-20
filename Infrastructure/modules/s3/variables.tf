locals {
  workspaces = {
    dev = {
      bucket_name = "data-ingestion"
      region      = "ap-south-1"
      environment = "dev"
    }
    prod = {
      bucket_name = "my-bucket-prod"
      region      = "ap-south-1"
      environment = "prod"
    }
  }
}