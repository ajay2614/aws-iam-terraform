// Outputs are printed after `terraform apply`.
output "iam_role_name" {
  // The actual IAM role name created in AWS.
  // aws_iam_role = resource type, iam_role = local alias, name = AWS role name.
  value       = aws_iam_role.iam_role.name
  description = "Name of the IAM role created by Terraform."
}
