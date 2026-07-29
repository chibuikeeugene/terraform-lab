terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {

}

locals {
  message  = "${var.student_name} is learning ${var.course_name}"
  message2 = "Current level: ${var.experience_level}."
}

resource "local_file" "student" {
  filename = "${path.module}/student.txt"
  content  = <<EOT
  ${local.message}
  ${local.message2}
  EOT
}

resource "local_file" "summary" {
  filename = "${path.module}/summary.txt"
  content  = <<-EOT
  Student file: ${local_file.student.filename}
  Student: ${var.student_name}
  Course: ${var.course_name}
  EOT
}