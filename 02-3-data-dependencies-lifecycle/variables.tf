variable "application_name" {
  description = "Name of the application"
  type        = string
  default     = "training-app"
}

variable "release_number" {
  description = "application release number"
  type        = number
  default     = 2

  validation {
    condition     = var.release_number > 0
    error_message = "The release number must be greater than zero"
  }
}

variable "external_setting" {
  description = "A setting controlled by another process"
  type        = string
  default     = "changed-outside-terraform"

}

variable "environment" {
  description = "Deployment environment"
  type        = string
  default     = "dev"
  validation {
    condition = contains(
      ["dev", "prod", "staging"],
      var.environment
    )
    error_message = "Environment must be either dev, prod or staging"
  }

}