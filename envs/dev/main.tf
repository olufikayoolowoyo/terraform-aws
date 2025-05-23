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

module "alb" {
  source            = "../../modules/alb"
  env               = var.environment
  vpc_id            = data.terraform_remote_state.networking.outputs.vpc_id
  public_subnet_ids = data.terraform_remote_state.networking.outputs.public_subnet_ids
  sg_alb_id         = module.sg.alb_id
  tags              = var.tags
}