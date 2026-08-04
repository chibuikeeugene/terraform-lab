terraform {
  required_providers {
    local = {
      source  = "hashicorp/local",
      version = "~> 2.0"
    }
  }
}

provider "local" {}

resource "local_file" "team-members" {
  count    = length(var.team-members)
  filename = "${path.module}/count-${count.index}.txt"
  content  = "Team member: ${var.team-members[count.index]}"
}

resource "local_file" "users" {
  for_each = var.users

  filename = "${path.module}/${each.key}.txt"
  content  = <<-EOT
  Name: ${upper(each.key)}
  Role: ${each.value.role}
  Status: ${each.value.active ? "active" : "inactive"}
  Skills: ${join(",", each.value.skills)}
  EOT
}

resource "local_file" "summary" {
  count    = var.create-summary ? 1 : 0
  filename = "${path.module}/summary.txt"
  content  = "Configured Users: ${join(", ", keys(var.users))}"
}