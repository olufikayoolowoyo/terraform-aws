variable "env" {}

variable "vpc_id" {}

variable "public_subnet_ids" {
  type = list(string)
}

variable "sg_alb_id" {}

variable "tags" {
  type    = map(string)
  default = {}
}
