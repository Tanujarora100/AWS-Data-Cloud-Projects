resource "aws_kms_key" "kms-state-encryption-key" {
    description             = "KMS key for encrypting state"
    enable_key_rotation     = true
}

resource "aws_kms_alias" "state-kms-alias" {
    name          = "alias/data-ingestion-state-key"
    target_key_id = aws_kms_key.kms-state-encryption-key.id 
}

