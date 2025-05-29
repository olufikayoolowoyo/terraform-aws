variable "env" {
  description = "The environment for the resources"
  type        = string
}

variable "vpc_id" {
  description = "The VPC ID where the security groups will be created"
  type        = string
}
variable "tags" {
  description = "Tags to apply to the security groups"
  type        = map(string)
  default     = {}
}