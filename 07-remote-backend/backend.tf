data "aws_dynamodb_table" "dy-db-tf-state-lock-table" {
  name = "tf-state-locking-table"
}

data "aws_s3_bucket" "s3-tf-state-s3-bucket" {
  bucket = "terraform-state-storage-bucket-01"
}


terraform {
  backend "s3" {
    region = var.AWS_REGION
    bucket = data.aws_dynamodb_table.dy-db-tf-state-lock-table.name
    key = "state/07-remote-backend/terraform.tfstate"
    dynamodb_table = data.aws_dynamodb_table.dy-db-tf-state-lock-table.name

  }
}
output "s3_bucket" {
  value = data.aws_s3_bucket.s3-tf-state-s3-bucket.bucket
}

output "dyn_db_table" {
  value = data.aws_dynamodb_table.dy-db-tf-state-lock-table.name
}
