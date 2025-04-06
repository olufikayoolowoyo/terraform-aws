# This file is part of the Terraform AWS SSO Admin module.
# Retrieves the SSO Admin instance IDs in the current AWS account and region.
data "aws_ssoadmin_instances" "this" {}

locals {
    # 🔹 Get the first SSO Admin instance ID
    identity_store_id = tolist(data.aws_ssoadmin_instances.this.identity_store_ids)[0]
  }

# 🔹 Create a sample group in Identity Center
resource "aws_identitystore_group" "test_it_ops" {
  display_name      = "TestITOps"
  identity_store_id = local.identity_store_id
  description       = "Users who manage IAM identities"
}

# Assign new user to the TestITOps group
resource "aws_identitystore_group_membership" "test_it_ops" {
  identity_store_id = local.identity_store_id # Identity Store ID
  # 🔹 Use the group ID from the aws_identitystore_group resource
  group_id          = aws_identitystore_group.test_it_ops.group_id
  # 🔹 Use the user ID from the aws_identitystore_user resource
  member_id = aws_identitystore_user.test_it_ops_user.user_id
}