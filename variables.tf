variable "aws_region" {
  type        = string
  description = "AWS region to use for the provider."
  default     = "us-east-1"
}

variable "role_name_prefix" {
  type        = string
  description = "Prefix for the IAM role name."
  default     = "iam-terraform-role"
}

variable "create_role" {
  type        = bool
  description = "Whether to create the IAM role."
  default     = true
}

variable "create_user" {
  type        = bool
  description = "Whether to create the IAM user."
  default     = false
}

variable "create_group" {
  type        = bool
  description = "Whether to create the IAM group."
  default     = false
}

variable "user_name" {
  type        = string
  description = "Name of the IAM user to create."
  default     = "iam-terraform-user"
}

variable "group_name" {
  type        = string
  description = "Name of the IAM group to create."
  default     = "iam-terraform-group"
}

variable "attach_s3_readonly_to_role" {
  type        = bool
  description = "Whether to attach AmazonS3ReadOnlyAccess to the role."
  default     = true
}

variable "attach_s3_readonly_to_group" {
  type        = bool
  description = "Whether to attach AmazonS3ReadOnlyAccess to the group."
  default     = false
}
