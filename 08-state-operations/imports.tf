# import an already existing service - s3 bucket
import {
  to = module.storage.aws_s3_bucket.this
  id = var.import_bucket_name
}

import {
  to = module.storage.aws_vpc.test_vpc
  id = var.vpc_id
}
