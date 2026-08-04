variable "team-members" {
  description = "Names of the team members"
  type        = list(string)
  default     = ["Ade", "Kemi", "Funke"]
}

variable "create-summary" {
  description = "whether the summary file should be created"
  type        = bool
  default     = true
}

variable "users" {
  description = "users and their configuration"
  type = map(object({
    role   = string
    active = bool
    skills = list(string)
  }))
  default = {
    Ade = {
      role   = "student"
      active = true
      skills = ["Terraform", "docker"]
    }

    Kemi = {
      role   = "developer"
      active = false
      skills = ["Python", "Github actions"]
    }

    Funke = {
      role   = "tester"
      active = true
      skills = ["Testing", "Linux"]
    }
    Eugene = {
      role   = "cloud engineer"
      active = true
      skills = ["AWS", "Terraform", "Kubernetes", "Github actions"]
    }
  }

}