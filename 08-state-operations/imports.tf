# import an already existing service - s3 bucket
import {
  to = aws_s3_bucket.application_data
  id = var.import_bucket_name
}

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