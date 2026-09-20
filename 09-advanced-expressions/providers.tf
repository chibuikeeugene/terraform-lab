provider "aws" {
  region = var.aws_region
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = "Terraform-course"
      Environment = var.environment
      Lesson      = "9"
    }
  }
}