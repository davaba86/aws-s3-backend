# Terraform AWS S3 Backend Module

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

## Abbreviations

| Abbreviation | Expanded    | Description |
| ------------ | ----------- | ----------- |
| TF           | Terraform   |             |
| env          | Environment |             |
| dir          | Directory   |             |
