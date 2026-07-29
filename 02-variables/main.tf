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
  message = "${var.student_name} is learning ${var.course_name}"
}

resource "local_file" "student" {
  filename = "${path.module}/student.txt"
  content  = local.message
}