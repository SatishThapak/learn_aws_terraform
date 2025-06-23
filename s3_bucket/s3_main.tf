# Variables
variable "bucket_name" {}
variable "name" {}
variable "environment" {}

# output as bucket name
output "remote_state_s3_bucket_name" {
  value = aws_s3_bucket.remote_state_bucket.id
}

# create s3 bucket 
resource "aws_s3_bucket" "remote_state_bucket" {
  bucket = var.bucket_name

  tags = {
    Name        = var.name
    Environment = var.environment
  }
}


