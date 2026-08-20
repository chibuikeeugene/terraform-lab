variable "name_prefix" {
  description = "The prefix used in the AWS resource name"
  type        = string
  validation {
    condition     = length(trimspace(var.name_prefix)) > 3
    error_message = "The name prefix must have more than 3 characters"
  }
}

variable "vpc_cidr" {
  description = "The cidr assigned to the vpc"
  type        = string
  validation {
    condition     = can(cidrnetmask(var.vpc_cidr))
    error_message = "The assigned cidr value must be a valid one."
  }
}

variable "public_subnets" {
  description = "The public subnet to create"
  type = map(object({
    cidr             = string
    availability_zone = string
  }))
}

variable "tags" {
  description = "Additional tag assigned to module resources"
  type        = map(string)
  default     = {}
}