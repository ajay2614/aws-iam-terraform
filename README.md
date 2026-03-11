# AWS IAM Role (Simple)

This project creates **one IAM role** and nothing else.

## Files

- `main.tf` — defines the IAM role
- `variables.tf` — input variables
- `outputs.tf` — output values

## Run

```bash
terraform init
terraform plan
terraform apply
```

## Inputs

- `aws_region` (default: `us-east-1`)
- `role_name` (default: `iam-terraform-role`)

Override example:

```bash
terraform apply -var "role_name=my-simple-role"
```
