output "aws_account_id" {
  description = "AWS account in which the resources was created"
  value       = data.aws_caller_identity.current.account_id
}

output "vpc_id" {
  description = "The ID of the vpc"
  value       = module.primary_network.vpc_id
}

output "vpc_arn" {
  description = "The ARN of the vpc"
  value       = module.primary_network.vpc_arn
}

output "public_subnet_ids" {
  description = "The ID of the public subnet"
  value       = module.primary_network.public_subnet_ids
}

output "public_route_table_id" {
  description = "The ID of the route table"
  value       = module.primary_network.public_route_table_id
}

output "aws_internet_gateway_id" {
  description = "The ID of the internet gateway"
  value       = module.primary_network.aws_internet_gateway_id
}