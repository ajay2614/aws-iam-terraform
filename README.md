# AWS IAM Terraform

Start here. This repo creates IAM resources using Terraform (role/user/group) with simple on/off toggles.

## Files to Read

- `OVERVIEW.md`
- `WORKFLOW.md`
- `SYNTAX.md`
- `TERRAFORM_COMMANDS_NOTES.md`
- `ADVANCED_EXAMPLES.md`

## Quick Start

```bash
terraform init
terraform plan
terraform apply
```

## Notes

Terraform loads all `*.tf` files in the folder where you run the command. That folder is the "root" for Terraform.
