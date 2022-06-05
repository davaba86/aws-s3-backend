terraform {
  # backend "s3" {}
}

resource "aws_s3_bucket" "server_access_loggin" {
  bucket = "audit-server-access-logging-${terraform.workspace}"

  # Prevent accidental deletion of this S3 bucket
  lifecycle {
    prevent_destroy = true
  }

  aws_tags_base = var.aws_tags_base
}

resource "aws_s3_bucket_public_access_block" "server_access_loggin" {
  bucket = aws_s3_bucket.server_access_loggin.id

  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true
}


module "tf_s3_backend" {
  source  = "davaba86/s3-backend/aws"
  version = "0.2.6"

  s3_bucket_name     = "base-statefiles-${var.env_short}"
  s3_logging_bucket  = "audit-server-access-logging-${var.env_short}"
  s3_expiration_days = "14"

  dynamodb_table_name = "base-statelocks-${var.env_short}"

  aws_tags_base = var.aws_tags_base
}
