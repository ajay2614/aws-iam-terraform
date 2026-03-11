# ============================================================================== 
# SIMPLE IAM ROLE ONLY (BEGINNER-FRIENDLY)
# This file creates exactly one IAM role.
# ============================================================================== 

# Required: define Terraform/provider versions for this project.
terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

# Required (for AWS resources): how Terraform connects to AWS.
provider "aws" {
  region = var.aws_region
}

# Resource syntax:
# resource "TYPE" "NAME" { ... }
# - TYPE = provider resource type (what you are creating in AWS)
# - NAME = local alias you choose (used only inside Terraform)
# Reference example: aws_iam_role.iam_role.name

# Creates the IAM role.
# "aws_iam_role" = resource type (actual IAM role)
# "iam_role"     = local alias for referencing inside Terraform
resource "aws_iam_role" "iam_role" {
  # Role name (from variables.tf)
  name = var.role_name

  # Trust policy = who can assume this role (EC2 in this example)
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Effect = "Allow"
        Action = "sts:AssumeRole"
        Principal = {
          Service = "ec2.amazonaws.com"
        }
      }
    ]
  })
}
