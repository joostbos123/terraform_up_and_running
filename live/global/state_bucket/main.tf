# This code can be run to setup the remote state storage. Note that before 
# this is ran, the bucket and DynamoDB must first be created. Hence, 
# this is commented out at first

# # Set backend
# terraform {
#   backend "s3" {
#     bucket         = "terraform-state-bucket-boilerplate" # Must be same value as var.bucket_name
#     key            = "global/state_bucket/terraform.tfstate"
#     region         = "eu-central-1"
#     dynamodb_table = "terraform-state-lock-boilerplate" # Must be same value as var.table_name
#     encrypt        = true
#   }
# }
