variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "acl" {
  description = "Access control list (ACL) for the bucket"
  type        = string
  default     = "private"
}

variable "tags" {
  description = "Tags for the bucket"
  type        = map(string)
  default     = {}
}
