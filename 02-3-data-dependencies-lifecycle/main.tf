terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {}

data "local_file" "source_policy" {
  filename = "${path.module}/source-policy.txt"
}

resource "local_file" "application" {
  filename = "${path.module}/${var.application_name}.txt"
  content  = <<-EOT
  Application: ${var.application_name}
  Environment: ${var.environment}
  Release: ${var.release_number}
  EOT
}

resource "local_file" "report" {
  # implicit dependencies
  filename = "${path.module}/report.txt"
  content  = <<-EOT
  Application file: ${local_file.application.filename}

  Source policy: ${data.local_file.source_policy.content}
  EOT
}

resource "local_file" "audit" {
  depends_on = [
    local_file.application
  ]
  filename = "${path.module}/audit.txt"
  content  = "This application resource was processed before this audit record"
}


resource "terraform_data" "release_marker" {
  input = var.release_number

  triggers_replace = [
    var.release_number
  ]

  lifecycle {
    create_before_destroy = true
  }
}

resource "terraform_data" "protected_record" {
  input = "Important production record"

  lifecycle {
    prevent_destroy = false
  }
}

resource "terraform_data" "external_setting" {
  input = var.external_setting

  lifecycle {
    ignore_changes = [
      input
    ]
  }
}

resource "local_file" "environment_summary" {
  filename = "${path.module}/${var.environment}_summary.txt"
  content  = <<-EOT
  Environment: ${var.environment}
  Application_file: ${local_file.application.filename}
  Report_file: ${local_file.report.filename}
  EOT
}

resource "local_file" "completion" {
  depends_on = [local_file.environment_summary]
  filename   = "${path.module}/completion.txt"
  content    = "Environment configuration completed"
}