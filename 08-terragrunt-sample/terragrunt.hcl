generate "backend" {
  path      = "backend.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
terraform {
  backend "s3" {
    bucket         = "my-terraform-state"
    key            = "${path_relative_to_include()}/terraform.tfstate"
    region = "ap-south-1"    
    encrypt        = true
    dynamodb_table = "tf-state-locking-table"
  }
}
EOF
}