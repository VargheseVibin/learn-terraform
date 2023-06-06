locals {
  #Load Account-Level variables
  account_vars = read_terragrunt_config(find_in_parent_folders("account.hcl"))

  #Load Region-Level variables
  region_vars = read_terragrunt_config(find_in_parent_folders("region.hcl"))

  #Load Environment-Level variables
  environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))

  account_name = local.account_vars.locals.account_name
  aws_account_id = local.account_vars.locals.aws_account_id
  aws_region = local.region_vars.locals.aws_region
}

generate "provider" {
  path = "provider.tf"
  if_exists = "overwrite_terragrunt"
  contents = <<EOF
    provider "aws" {
      region = "${local.aws_region}"
    }
  EOF
}

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

remote_state {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key = "${path_relative_to_include()}/terraform.tfstate"
    region = "${local.aws_region}"
    dynamodb_table = "tf-state-locking-table"  
  }
  generate = {
    path = "backend.tf"
    if_exists = "overwrite_terragrunt"
  }
}
