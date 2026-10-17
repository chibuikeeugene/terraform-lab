resource "aws_security_group" "driftlab" {
  name = "terraform-drift-lab"
  description = "terraform drift training"
  vpc_id = var.vpc_id
  tags = {
    Environment = "manual-change"
    ManagedBy = "Terraform"
  }
}