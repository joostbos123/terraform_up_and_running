# -------------------------------------------------------------
# Creating a state bucket
#
# Because it is a best practice to store Terraform state files 
# on a remote storage (here, S3), this script can be used to set
# up the required infrastructure, consisting of a bucket and a
# DynamoDB to lock the file when someone is using it.
#
# Because this introduces a catch-22 situation - Terraform should
# store its state in a remote storage, but Terraform must first
# be run to create that remote storage, which leads to local state
#  -  this code sits apart from the main code and should be run
# BEFORE the other code is run. The created bucket can then be
# used as remote stage storage afterwards
#
# -------------------------------------------------------------

resource "aws_s3_bucket" "terraform_state" {

  bucket = var.bucket_name

  // This is only here so we can destroy the bucket as part of automated tests. You should not copy this for production
  // usage
  force_destroy = true

}

# Enable versioning so you can see the full revision history of your
# state files
resource "aws_s3_bucket_versioning" "enabled" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

# Enable server-side encryption by default
resource "aws_s3_bucket_server_side_encryption_configuration" "default" {
  bucket = aws_s3_bucket.terraform_state.id

  rule {
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
  }
}

# Explicitly block all public access to the S3 bucket
resource "aws_s3_bucket_public_access_block" "public_access" {
  bucket                  = aws_s3_bucket.terraform_state.id
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}
