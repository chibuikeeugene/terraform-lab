# rename/move resource to aws_s3_bucket.application_data
moved {
  from = aws_s3_bucket.legacy
  to = aws_s3_bucket.application_data
}

# move aws_s3_bucket resource to module
moved {
  from = aws_s3_bucket.application_data
  to = module.storage.aws_s3_bucket.this
}

removed {
  from = aws_s3_bucket.application_data
  lifecycle {
    destroy = false
  }
}