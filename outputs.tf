output "iam_role_name" {
  value       = var.create_role ? aws_iam_role.iam_role[0].name : null
  description = "Name of the IAM role created by Terraform."
}

output "iam_user_name" {
  value       = var.create_user ? aws_iam_user.iam_user[0].name : null
  description = "Name of the IAM user created by Terraform."
}

output "iam_group_name" {
  value       = var.create_group ? aws_iam_group.iam_group[0].name : null
  description = "Name of the IAM group created by Terraform."
}
