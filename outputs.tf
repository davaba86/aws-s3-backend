output "backend_bucket_name" {
  value = aws_s3_bucket.terraform_statefiles.bucket
}

output "backend_bucket_arn" {
  value = aws_s3_bucket.terraform_statefiles.arn
}
