output "kms-key-arn" {
  value = aws_kms_key.kms-general-use.arn
}

output "kms-key-id" {
  value = aws_kms_key.kms-general-use.id
}
