provider "aws" {
  region = var.aws_primary_region
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = var.project_name
      Environment = var.environment
    }

  }
}

provider "aws" {
  alias = "secondary"
  region = var.aws_secondary_region
  default_tags {
    tags = {
      ManagedBy   = "Terraform"
      Project     = var.project_name
      Environment = var.environment
      RegionRole = "secondary"
    }

  }
}