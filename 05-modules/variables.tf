variable "users" {
  description = "Users whose profile files will be created"
  type = map(object({
    role   = string
    skills = list(string)
    active = bool
  }))
  default = {
    Ben = {
      role   = "Software engineer"
      skills = ["python", "java"]
      active = true
    }
    Eugene = {
      role   = "Cloud and platform engineer"
      skills = ["terraform", "AWS", "Kubernetes"]
      active = true
    }
    Gabriella = {
      role   = "QA Engineer"
      skills = ["Pytest", "Ansible"]
      active = false
    }
  }
}