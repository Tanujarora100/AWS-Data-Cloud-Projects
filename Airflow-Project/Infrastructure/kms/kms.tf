resource "aws_kms_key" "kms-general-use" {
  description         = "KMS key for encrypting resources- General use"
  enable_key_rotation = true
}

resource "aws_kms_alias" "general-kms-alias" {
  name          = "alias/data-ingestion-general-use-key"
  target_key_id = aws_kms_key.kms-general-use.id
}

