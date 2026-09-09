resource "aws_s3_bucket" "this" {
  bucket = var.bucket_name
}

resource "aws_vpc" "test_vpc" {
  cidr_block = var.cidr_block
  enable_dns_hostnames = false
  enable_dns_support = true
  tags = {
    Name = "legacy-vpc"
  }
}