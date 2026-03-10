# Workflow Steps

1. Run `terraform init` to download providers.
2. Run `terraform plan` to see what Terraform would change.
3. Run `terraform apply` to create or update resources.
4. Terraform writes a state file so it can manage those resources later.
5. Run `terraform destroy` to delete resources in state.

If `create_role=true`:
- Terraform generates a random hex suffix.
- Terraform creates the IAM role.
- Terraform attaches S3 read-only policy if enabled.

If `create_user=true`:
- Terraform creates the IAM user.

If `create_group=true`:
- Terraform creates the IAM group.
- Terraform attaches S3 read-only policy if enabled.

If both `create_user=true` and `create_group=true`:
- Terraform adds the user to the group.
