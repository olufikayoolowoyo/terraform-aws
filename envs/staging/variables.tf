# Define environment-specific input variables
variable "bucket_name" {
    description = "Name of the S3 bucket"
    type        = string
    default     = "tf-bootstrap-staging"
}

variable "acl" {
  description = "Access control list (ACL) for the bucket"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)
  default     = {
    Environment = "staging"
    Project     = "terraform-aws"
  }
}
variable "environment" {
  description = "The environment for the deployment (e.g., dev, prod)"
  type        = string
  default     = "staging"
}