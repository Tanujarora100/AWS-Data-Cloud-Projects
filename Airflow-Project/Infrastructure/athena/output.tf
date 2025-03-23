output "athena_database_name" {
  description = "The name of the Athena database."
  value       = aws_athena_database.athena-airflow-database.name
}

output "athena_database_arn" {
  description = "The name of the Athena workgroup."
  value       = aws_athena_workgroup.airflow-workgroup.arn
}

output "athena_output_location" {
  description = "The S3 location for Athena query results."
  value       = aws_athena_workgroup.airflow-workgroup.configuration.0.result_configuration.0.output_location
}
