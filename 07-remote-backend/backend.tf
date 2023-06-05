data "aws_dynamodb_table" "dy-db-tf-state-lock-table" {
  name = "tf-state-locking-table"
}

data "aws_s3_bucket" "s3-tf-state-s3-bucket" {
  bucket = "terraform-state-storage-bucket-01"
}


terraform {
  backend "s3" {
    region = "ap-south-1"
#    bucket = data.aws_dynamodb_table.dy-db-tf-state-lock-table.name
    bucket = "terraform-state-storage-bucket-01"
    key = "state/07-remote-backend/terraform.tfstate"
#    dynamodb_table = data.aws_dynamodb_table.dy-db-tf-state-lock-table.name
    dynamodb_table = "tf-state-locking-table"

  }
}
output "s3_bucket" {
  value = data.aws_s3_bucket.s3-tf-state-s3-bucket.bucket
}

output "dyn_db_table" {
  value = data.aws_dynamodb_table.dy-db-tf-state-lock-table.name
}
