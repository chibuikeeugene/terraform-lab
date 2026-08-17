data "aws_caller_identity" "current" {

}

module "network" {
  source = "./modules/network"

  name_prefix    = "${var.project_name}-${var.environment}"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  tags = {
    Lesson    = "5"
    Component = "network"
  }
}