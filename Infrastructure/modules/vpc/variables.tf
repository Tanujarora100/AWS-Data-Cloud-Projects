variable "vpc-name" {
  description = "Name of the VPC"
  type        = string
  default     = "data-vpc"
  nullable    = false
}
variable "vpc-cidr-block" {
  description = "CIDR block for the VPC"
  type        = string
  default     = ""
  nullable    = false
}
variable "owner" {
  description = "Owner of the VPC"
  type        = string
  default     = "tanujarora2703@gmail.com"
  nullable    = false
}
variable "project" {
  description = "Project or environment name"
  type        = string
  default     = "data-pipeline"
}
