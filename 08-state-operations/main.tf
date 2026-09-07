# resource "aws_s3_bucket" "application_data" {
#   bucket = var.import_bucket_name
# }

module "storage" {
  source = "./modules/storage"
  bucket_name = var.import_bucket_name
}