variable "name" {
  description = "Name used in the generated file"
  type        = string
  validation {
    condition     = length(trimspace(var.name)) >= 2
    error_message = "The name must contain at least two characters."
  }
}

variable "role" {
  description = "The role assigned to the user"
  type        = string
}


variable "skills" {
  description = "The skilled given to the user"
  type        = list(string)
  default     = []
}

variable "output_directory" {
  description = "Directory in which the profile is created"
  type        = string
}

variable "environment" {
  description = "The environment assigned to each profile user"
  type        = string
  validation {
    condition = contains(
      ["Development", "Staging", "Production"], var.environment
    )
    error_message = "Environment must be either staging, development or production"
  }
}