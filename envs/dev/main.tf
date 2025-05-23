module "s3_bucket" {
  source     = "../../modules/s3"
  bucket_name = "${var.bucket_name}-${var.environment}"
  acl        = var.acl
  tags       = merge(var.tags, {
    Environment = var.environment
  })
}

module "vpc" {
  source               = "../../modules/vpc"
  env                  = var.environment
  vpc_cidr             = var.vpc_cidr
  azs                  = var.azs
  public_subnet_cidrs  = var.public_subnet_cidrs
  private_subnet_cidrs = var.private_subnet_cidrs
  tags                 = var.tags
}