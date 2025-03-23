module "sns_topic" {
  source = "../sns"
}
module "kms" {
  source = "../kms"
}
module "s3_bucket" {
  source = "../ingestion-bucket"
}