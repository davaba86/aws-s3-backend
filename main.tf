# ##############################################################################
# AWS: S3
# ##############################################################################

resource "aws_s3_bucket" "terraform_statefiles" {
  bucket = var.s3_bucket_name

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  tags = var.aws_tags_base
}

resource "aws_s3_bucket_versioning" "terraform_statefiles" {
  bucket = aws_s3_bucket.terraform_statefiles.id
  versioning_configuration {
    # Keep revision history of our state file
    status = "Enabled"
  }
}

resource "aws_s3_bucket_server_side_encryption_configuration" "terraform_statefiles" {
  bucket = aws_s3_bucket.terraform_statefiles.bucket

  rule {
    # Enable S3 Server Side Encryption (S3-SSE)
    apply_server_side_encryption_by_default {
      sse_algorithm = "AES256"
    }
    bucket_key_enabled = false
  }
}

resource "aws_s3_bucket_logging" "terraform_statefiles" {
  # If bucket name passed to module none then do nothing
  count = var.s3_logging_bucket != "none" ? 1 : 0

  bucket = aws_s3_bucket.terraform_statefiles.id

  target_bucket = var.s3_logging_bucket
  target_prefix = "log/"
}

# ##############################################################################
# AWS: DynamoDB
# ##############################################################################

resource "aws_dynamodb_table" "terraform_statelocks" {
  name         = var.dynamodb_table_name
  billing_mode = "PAY_PER_REQUEST"
  hash_key     = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }

  tags = var.aws_tags_base
}
