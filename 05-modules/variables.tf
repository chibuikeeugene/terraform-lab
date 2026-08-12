variable "users" {
  description = "Users whose profile files will be created"
  type = map(object({
    role        = string
    skills      = list(string)
    active      = bool
    environment = string
  }))
  default = {
    Ben = {
      role        = "Software engineer"
      skills      = ["python", "java"]
      active      = true
      environment = "Production"
    }
    Eugene = {
      role        = "Cloud and platform engineer"
      skills      = ["terraform", "AWS", "Kubernetes"]
      active      = true
      environment = "Production"
    }
    Gabriella = {
      role        = "QA Engineer"
      skills      = ["Pytest", "Ansible"]
      active      = false
      environment = "Staging"
    }
  }
}