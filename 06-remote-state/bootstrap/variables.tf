variable "aws_region" {
  description = "The AWS region for the terraform state bucket"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "terraform-state"
}