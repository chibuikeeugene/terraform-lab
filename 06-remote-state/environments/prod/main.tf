data "aws_caller_identity" "current" {

}

module "primary_network" {
  source = "../../modules/network"

  name_prefix    = "${var.project_name}-${var.environment}"
  vpc_cidr       = var.vpc_cidr
  public_subnets = var.public_subnets
  tags = {
    RegionRole = "primary"
  }
}

module "secondary_network" {
  count          = var.create_secondary_network ? 1 : 0
  providers = {
    aws = aws.secondary
  }
  source         = "../../modules/network"
  name_prefix    = "${var.project_name}-prod-secondary"
  vpc_cidr       = "10.40.0.0/16"
  public_subnets = {
    "public_a" = {
      cidr = "10.40.1.0/24"
      availability_zone = "eu-west-1a"
    }
    "public_b" = {
      cidr = "10.40.2.0/24"
      availability_zone = "eu-west-1b"
    
  }
  tags = {
    RegionRole = "secondary"
  }

}