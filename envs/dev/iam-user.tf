
# 🔹 Create a sample user in Identity Center
resource "aws_identitystore_user" "test_it_ops_user" {
  identity_store_id =  data.aws_ssoadmin_instances.this.identity_store_ids[0]

  user_name = "testTFUser"
  display_name = "Test TFUser"

  name {
    given_name  = "TestFName"
    family_name = "TestLName"
  }

  emails {
    value    = "john.doe@circularmaterial.ca"
    primary  = true
    type     = "work"
  }
}