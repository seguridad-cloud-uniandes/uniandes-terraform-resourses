# S3 Bucket for Terraform state
resource "aws_s3_bucket" "terraform_state" {
  bucket = "infraestructura-pocblog"

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Wheels on demand State Bucket"
  }
}

# Enable versioning for the S3 bucket
resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id

  versioning_configuration {
    status = "Enabled"
  }
}

# DynamoDB Table for state locking
resource "aws_dynamodb_table" "state_lock_table" {
  name         = "pocblog-locks"
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Wheels on demand State Lock Table"
  }
}
