variable "aws_region" {
  description = "Current aws region"
  default = "eu-central-1"
  type = string
}

variable "import_bucket_name" {
  description = "Existing S3 bucket that terraform will adopt"
  type = string
}

variable "vpc_id" {
  description = "existing ID of our vpc"
  type = string
}

variable "cidr_block" {
  description = "The IP address for the vpc"
  type = string
}