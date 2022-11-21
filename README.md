# Boilerplate Terraform

Boilerplate for AWS application based on examples from Terraform: Up and Running (3th edition)

# Set up the State Bucket

1. Run ```terraform init``` and```terraform apply``` respectively from the live/global/state_bucket folder

# Put terraform state file (of state_bucket) on S3

1. Uncomment code in the live/global/state_bucket/main.tf file
2. Run ```terraform init``` from the live/global/state_bucket folder

# Create Stage environment
1. Run ```terraform init``` and ```terraform apply``` respectively from the live/stage/webserver-cluster folder
