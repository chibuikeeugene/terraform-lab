variable "aws_region" {
  description = "Current aws region"
  default = "eu-central-1"
  type = string
}

variable "import_bucket_name" {
  description = "Existing S3 bucket that terraform will adopt"
  type = string
}