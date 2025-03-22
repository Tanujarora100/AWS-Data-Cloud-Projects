resource "aws_s3_bucket_policy" "ingestion_bucket_policy" {
  bucket = aws_s3_bucket.source-ingestion-bucket.id

  policy = jsonencode({
    "Version" : "2012-10-17",
    "Id" : "EnforceTLSOnly",
    "Statement" : [
      {
        "Sid" : "DenyInsecureTransport",
        "Effect" : "Deny",
        "Principal" : "*",
        "Action" : "s3:*",
        "Resource" : [
          "arn:aws:s3:::data-ingestion-json-batch-pipeline",
          "arn:aws:s3:::data-ingestion-json-batch-pipeline/*"
        ],
        "Condition" : {
          "Bool" : {
            "aws:SecureTransport" : "false"
          }
        }
      }
    ]
  })
}