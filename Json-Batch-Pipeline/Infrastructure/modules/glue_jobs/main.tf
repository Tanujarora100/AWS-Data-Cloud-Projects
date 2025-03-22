
resource "aws_glue_job" "data-transformation-glue-job-one" {
    name        = local.dev-environment.glue_job_name
    role_arn    = aws_iam_role.glue-iam-role.arn
    description = "Data Transformation Glue Job"
    command {
        name            = "glueetl"
        script_location = local.dev-environment.script_location
        python_version  = "3.11"
    }

    default_arguments = {
        "--TempDir"                = "s3://${module.s3_bucket.bucket-name}/temp/"
        "--job-bookmark-option"    = "job-bookmark-enable"
        "--enable-metrics"         = ""
    }

    max_retries          = 2
    timeout              = 10
    glue_version         = "3.0"
    number_of_workers    = local.dev-environment.number_of_workers
    worker_type          = local.dev-environment.worker_type
}

resource "aws_iam_role" "glue-iam-role" {
    name = local.dev-environment.glue_job_role_name

    assume_role_policy = jsonencode({
        Version = "2012-10-17"
        Statement = [
            {
                Action = "sts:AssumeRole"
                Effect = "Allow"
                Principal = {
                    Service = "glue.amazonaws.com"
                }
            }
        ]
    })
}

resource "aws_iam_role_policy_attachment" "glue_policy_attachment" {
    role       = aws_iam_role.glue-iam-role.name
    policy_arn = "arn:aws:iam::aws:policy/service-role/AWSGlueServiceRole"
}
