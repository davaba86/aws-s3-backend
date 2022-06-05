# Terraform AWS S3 Backend Module

## TLDR

Instead of creating and managing my backends manually I prefer to keep it in a custom module.

This module creates an S3 bucket for the TF statefiles and DyanmoDB table for the statelocks.

## Setup

1. Ensure you're able to authenticate to AWS and verify with for eg. `aws sts get-caller-identity`.
2. Go to your working directory where you'll be running your TF code.
3. Copy `base-s3-backend.tf` and `base-s3-backend.tfbackend` from example dir, and don't forget to change the bucket name since they are globally unique.
4. Initialise the TF env.

   ```bash
   terraform init
   ```

5. Uncomment `backend "s3" {}` in `base-s3-backend.tf`.
6. Initialise the TF env but this time specifying the S3 backend parameters.

   ```bash
   terraform init -backend-config base-s3-backend.tfbackend
   ```

7. Verify you're in full sync with the remote S3 state by checking no additinal changes are planned.

```bash
terraform plan
```

## S3 Server Access Loggin

By default loggin is no enabled on the bucket created by the module however to change this override the var.s3_logging_bucket which is passed down to the module.

## S3 Lifecycle Policy

In order to prevent indefinetly storage of objects and specifically versions I've set the limit to 14 days.

## Abbreviations

| Abbreviation | Expanded    | Description |
| ------------ | ----------- | ----------- |
| TF           | Terraform   |             |
| env          | Environment |             |
| dir          | Directory   |             |
