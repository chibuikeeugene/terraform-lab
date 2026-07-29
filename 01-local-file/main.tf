terraform {
  required_providers {
    local = {
      source = "hashicorp/local"
    }
  }
}

provider "local" {

}

resource "local_file" "weclome" {
  filename = "${path.module}/welcome.txt"
  content  = "Terraform detects and applies infrastructure changes"

}

resource "local_file" "student" {
  filename = "${path.module}/student.txt"
  content  = "I am learning infrastructure as code"
}