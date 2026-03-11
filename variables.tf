// Input variables: values you can override at runtime.

variable "aws_region" {
  type        = string
  description = "AWS region to use for the provider."
  default     = "us-east-1"
}

variable "role_name" {
  // This is the actual IAM role name that will be created in AWS.
  type        = string
  description = "Name of the IAM role to create."
  default     = "iam-terraform-role"
}
