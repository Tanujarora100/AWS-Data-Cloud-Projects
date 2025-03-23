locals {

  bucket_name = "data-ingestion-json-batch-pipeline"
  region      = "us-east-1"
  environment = "dev"
  kms_alias   = "data-ingestion-general-use-key"
}

variable "force_destroy" {
  default     = false
  description = "Value to enable force destroy of the bucket"
}
