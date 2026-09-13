variable "aws_region" {
  description = "The AWS region"
  type = string
  default = "eu-central-1"
}

variable "environment" {
  description = "The current environment"
  type = string
  default = "env"
}

variable "vpc_id" {
  description = "Existing VPC ID"
  type = string
}

variable "common_tags" {
  description = "Common tags applied to resources"
  type = map(string)
  default = {
    "ManagedBy" = "Terraform"
    "Course" =  "Terraform"
  }
}

variable "security_groups" {
  description = "Security groups and ingress configuration"
  type = map(object({
    description = optional(string, "Managed by Terraform")
    ingress_rules = optional(list(object({
        description = optional(string)
        from_port = number
        to_port = number
        protocol= optional(string, "tcp")
        cidr_block = optional(list(string), [])
        source_security_group = optional(string)
    })), [])
  }))
}