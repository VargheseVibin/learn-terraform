locals {
    environment_vars = read_terragrunt_config(find_in_parent_folders("environment.hcl"))
    environment = local.environment_vars.locals.environment
    base_source_url="git::git@github.com:VargheseVibin/terragrunt-example-modules.git//vpc"
}

terraform {
    source = "${local.base_source_url}?ref=v0.0.1"
}

inputs = {}