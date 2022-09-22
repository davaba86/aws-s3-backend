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
    TerraformManaged = true
  }
}

variable "s3_logging_bucket" {
  description = "Bucket name where log files will be sent."
  type        = string
  default     = "none"
}

variable "s3_logging_prefix" {
  description = "Separation of log files if bucket used for more."
  type        = string
  default     = "none"
}

variable "s3_expiration_days" {
  description = "Number of days before objects and versions expire."
  type        = string
  default     = "14"
}
