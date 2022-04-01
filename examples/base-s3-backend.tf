terraform {
  # backend "s3" {}
}

module "tf_s3_backend" {
  source = "github.com/davaba86/terraform-aws-s3-backend?ref=v0.2.0"

  s3_bucket_name      = "base-statefiles-${var.env_short}"
  dynamodb_table_name = "base-statelocks-${var.env_short}"
  aws_tags_base       = var.aws_tags_base
}
