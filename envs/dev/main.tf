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

module "asg" {
  source              = "../../modules/ec2-asg"
  env                 = "dev"
  ami_id              = var.ami_id
  instance_type       = "t3.micro"
  user_data           = file("${path.module}/userdata.sh")
  private_subnet_ids  = data.terraform_remote_state.networking.outputs.private_subnet_ids
  sg_ec2_id           = module.sg.ec2_id
  target_group_arn    = module.alb.target_group_arn
  desired_capacity    = 2
  min_size            = 1
  max_size            = 3
  tags                = var.tags
}