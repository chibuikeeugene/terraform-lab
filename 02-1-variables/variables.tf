variable "student_name" {
  description = "The name of the student"
  type        = string
  default     = "Eugene"
  validation {
    condition     = length(var.student_name) >= 2
    error_message = "The length of the student must contain at least two characters"
  }
}

variable "course_name" {
  description = "The name of the course"
  type        = string
  default     = "Terraform"
}


variable "experience_level" {
  description = "Current Terraform experience level"
  type        = string
  default     = "beginner"
}