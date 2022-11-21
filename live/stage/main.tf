terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

provider "aws" {
  region = "eu-central-1"

  default_tags {
    tags = {
      Owner     = "Joost"
      ManagedBy = "Terraform"
    }
  }
}

# Set backend
terraform {
  backend "s3" {
    bucket         = "terraform-state-bucket-boilerplate" # Must be same value as var.bucket_name in live/global/s3/variables.tf
    key            = "stage/terraform.tfstate"
    region         = "eu-central-1"                     # Must be same value as var.region in live/global/s3/variables.tf
    dynamodb_table = "terraform-state-lock-boilerplate" # Must be same value as var.table_name in live/global/s3/variables.tf
    encrypt        = true
  }
}

module "webserver-cluster" {
  source = "../../modules/services/webserver-cluster"
}
