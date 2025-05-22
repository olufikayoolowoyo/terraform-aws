module "s3_bucket" {
  source     = "../../modules/s3"
  bucket_name = "${var.bucket_name}-${var.environment}"
  acl        = var.acl
  tags       = merge(var.tags, {
    Environment = var.environment
  })
}
