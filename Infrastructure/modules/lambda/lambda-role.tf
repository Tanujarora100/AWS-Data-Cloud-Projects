data "aws_iam_policy_document" "assume_role" {
  statement {
    effect = "Allow"

    principals {
      type        = "Service"
      identifiers = ["lambda.amazonaws.com"]
    }

    actions = ["sts:AssumeRole"]
  }
}

resource "aws_iam_role" "data-ingestion-lambda-role" {
  name               = "data-ingestion-lambda-role"
  assume_role_policy = data.aws_iam_policy_document.assume_role.json
}

resource "aws_iam_role_policy" "data-ingestion-lambda-policy" {
  name = "data-ingestion-lambda-policy"
  role = aws_iam_role.data-ingestion-lambda-role.name
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action   = ["ec2:Describe*"]
        Effect   = "Allow"
        Resource = "*"
      },
      {
        Action   = ["s3:GetObject", "s3:PutObject", "s3:ListBucket", "s3:putObjectTagging"]
        Effect   = "Allow"
        Resource = ["arn:aws:s3:::data-ingestion-bucket-dev/*"]
      }
    ]
  })
}
