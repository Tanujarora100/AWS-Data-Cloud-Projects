
resource "aws_athena_database" "athena-airflow-database" {
  name   = var.database_name
  bucket = var.source_bucket
}





resource "aws_athena_workgroup" "airflow-workgroup" {
  count = var.enable_workgroup_configuration ? 1 : 0
  name  = var.workgroup_name

  configuration {
    enforce_workgroup_configuration = true

    result_configuration {
      output_location = var.query_output_location
    }
  }
}