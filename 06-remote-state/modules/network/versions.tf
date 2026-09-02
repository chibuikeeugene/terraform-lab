terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">=6.0"
      # configuration_aliases = [ aws.secondary ] # tells child module to expects additional provider config
    }
  }
}