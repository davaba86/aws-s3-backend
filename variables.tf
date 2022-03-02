variable "s3_bucket_name" {
  description = "The S3 bucket name containing the state files."
  type        = string
  default     = "base-statefiles-tst"
}

variable "dynamodb_table_name" {
  description = "The name of the DynamoDB table used to lock the state."
  type        = string
  default     = "base-statelocks-tst"
}

variable "aws_tags_base" {
  description = "AWS base tags to be applied."
  type        = map(any)
  default = {
    "terraform-created" = "true"
  }
}
