output "state_bucket_name" {
  description = "The bucket name of the terraform state object"
  value       = aws_s3_bucket.terraform_state.bucket
}

output "state_bucket_arn" {
  description = "The ARN of the terraform state bucket"
  value       = aws_s3_bucket.terraform_state.arn
}