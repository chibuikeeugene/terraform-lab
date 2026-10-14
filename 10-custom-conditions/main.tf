data "aws_ami" "this" {
  owners = ["amazon"]
}

# using custom-conditions: preconditions
resource "aws_instance" "app" {
  ami = data.aws_ami.this.id
  instance_type = var.instance_type

  lifecycle {
    precondition {
      condition = data.aws_ami.this.architecture == "x86_64"
      error_message = "AMI Architecture must be x86_64"
    }
  }
}

# using custom-conditions: postconditions
resource "aws_ebs_volume" "data" {
  availability_zone = "eu-central-1"
  size = 5
  encrypted = true

  lifecycle {
    prevent_destroy = true
    create_before_destroy = true
    postcondition {
      condition = self.encrypted
      error_message = "EBS volume must be encrypted"
    }
  }
}

variable "database_password" {
  type      = string
  sensitive = true
  ephemeral = true
}

resource "aws_db_instance" "example" {
  instance_class = "t2.micro"
  password_wo         = var.database_password
  password_wo_version = 1
}