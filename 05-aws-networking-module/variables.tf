variable "aws_region" {
  description = "The aws region resource is to be provisioned"
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  description = "The name of the project"
  type        = string
  default     = "basic-networking-module"
}


variable "environment" {
  description = "The deployment environment"
  type        = string
  default     = "dev"
  validation {
    condition     = contains(["dev", "prod", "staging"], var.environment)
    error_message = "The environment variable must either be dev, prod or staging"
  }
}

variable "vpc_cidr" {
  description = "The IPv4 CIDR value for our vpc"
  type        = string
  default     = "10.20.0.0/16"
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "vpc_cidr must be a valide IPv4 CIDR"
  }
}

variable "public_subnets" {
  description = "Public subnets to create"
  type = map(object({
    cidr       = string
    availability_zone = string
  }))
  validation {
    condition     = length(var.public_subnets) >= 2
    error_message = "At least two public subnets must be supplied"
  }
}