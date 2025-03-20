locals {
  workspace = {
    dev-ap-south-1 = {
      bucket_name = "data-ingestion-bucket-dev-json-batch-pipeline"
      region      = "ap-south-1"
      environment = "dev"
    }
    prod-ap-south-1 = {
      bucket_name = "data-ingestion-bucket-prod-json-batch-pipeline"
      region      = "ap-south-1"
      environment = "prod"
    }
  }
}

variable "workspace_key" {
  default = "dev-ap-south-1"
}



provider "aws" {
  region  = local.workspace[var.workspace_key].region
  profile = "default"
}

variable "force_destroy" {
  default     = false
  description = "Value to enable force destroy of the bucket"
}
