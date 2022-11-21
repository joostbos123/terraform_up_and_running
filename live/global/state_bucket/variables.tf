variable "bucket_name" {
  description = "The name of the S3 bucket. Must be globally unique."
  type        = string
  default     = "terraform-state-bucket-boilerplate"
}

variable "table_name" {
  description = "The name of the DynamoDB table. Must be unique in this AWS account."
  type        = string
  default     = "terraform-state-lock-boilerplate"
}

variable "region" {
  description = "The region in which the infrastructure will be created"
  type        = string
  default     = "eu-central-1"
}
