output "vpc_id" {
  description = "The id of the vpc"
  value       = aws_vpc.this.id
}

output "vpc_arn" {
  description = "The ARN of the vpc"
  value       = aws_vpc.this.arn
}

output "public_subnet_ids" {
  description = "The ids of the pubic subnet indexed by the subnet name"
  value = {
    for name, subnet in aws_subnet.public :
    name => subnet.id
  }
}

output "public_subnet_cidrs" {
  description = "The cidr addresses of each subnet"
  value = {
    for name, subnet in aws_subnet.public :
    name => subnet.cidr_block
  }
}

output "aws_internet_gateway_id" {
  description = "The id of the internet gateway"
  value       = aws_internet_gateway.this.id
}

output "public_route_table_id" {
  description = "The if of the public route table"
  value       = aws_route_table.public.id
}