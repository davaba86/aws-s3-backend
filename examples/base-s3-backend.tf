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


module "tf_s3_backend" {
  source = "github.com/davaba86/terraform-aws-s3-backend?ref=v0.2.0"

  s3_bucket_name    = "base-statefiles-${var.env_short}"
  s3_logging_bucket = "audit-server-access-logging-${var.env_short}"

  dynamodb_table_name = "base-statelocks-${var.env_short}"

  aws_tags_base = var.aws_tags_base
}
