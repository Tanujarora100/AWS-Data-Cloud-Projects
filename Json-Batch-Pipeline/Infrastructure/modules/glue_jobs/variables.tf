locals {
  dev-environment = {
    bucket_name        = "data-ingestion-json-batch-pipeline"
    region             = "us-east-1"
    environment        = "dev"
    number_of_workers  = 2
    glue_job_name      = "Marketplace-Data-Ingestion-Job"
    glue_job_role_name = "Data-Ingestion-Glue-Role"
    worker_type        = "G.1X"
    script_location    = "${module.s3_bucket.bucket-name}/scripts/data-ingestion-dev.py"
  }


}
