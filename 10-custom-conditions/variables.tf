variable "environment" {
  type = string
  validation {
    condition = contains(["dev","prod","staging"], var.environment)
    error_message = "Environment must be either of dev, prod or staging"
  }
}

variable "instance_count" {
  type = number
  validation {
    condition = (
        var.instance_count >= 1 && var.instance_count <= 10
    )
    error_message = "Instance count must be between 1 and 10"
  }
}

variable "instance_type" {
  type = string
}

# ephemeral and sensitive variable
variable "api_token" {
  type = string
  sensitive = true
  ephemeral = true
}