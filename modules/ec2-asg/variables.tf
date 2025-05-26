variable "env" {}
variable "ami_id" {}
variable "instance_type" {}
variable "user_data" {}
variable "private_subnet_ids" {
  type = list(string)
}
variable "sg_ec2_id" {}
variable "target_group_arn" {}
variable "desired_capacity" {}
variable "min_size" {}
variable "max_size" {}
variable "tags" {
  type = map(string)
}
