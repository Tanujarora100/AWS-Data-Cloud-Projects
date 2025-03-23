variable "source_bucket" {
  description = "The name of the S3 bucket"
  type        = string
  nullable    = false
  validation {
    condition     = length(var.source_bucket) > 0
    error_message = "The bucket name must be a non-empty string."
  }
}
variable "database_name" {
  description = "The name of the Athena database"
  type        = string
  nullable    = false
  validation {
    condition     = length(var.database_name) > 0
    error_message = "The database name must be a non-empty string."
  }
}

variable "query_output_location" {
  description = "The S3 location for Athena query results"
  type        = string
  nullable    = false
  validation {
    condition     = length(var.query_output_location) > 0
    error_message = "The query output location must be a non-empty string."
  }
}
variable "enable_workgroup_configuration" {
  description = "Enable workgroup configuration"
  type        = bool
  default     = true
}
variable "workgroup_name" {
  description = "The name of the Athena workgroup"
  type        = string
  default     = "airflow-workgroup"
  validation {
    condition     = length(var.workgroup_name) > 0
    error_message = "The workgroup name must be a non-empty string."
  }
}
