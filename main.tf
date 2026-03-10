terraform {
  required_version = ">= 1.5.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
    random = {
      source  = "hashicorp/random"
      version = "~> 3.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

resource "random_id" "role_id_suffix" {
  count       = var.create_role ? 1 : 0
  byte_length = 3
}

resource "aws_iam_role" "iam_role" {
  count = var.create_role ? 1 : 0
  name  = "${var.role_name_prefix}-${random_id.role_id_suffix[0].hex}"

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

data "aws_iam_policy" "s3_read_only" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}

resource "aws_iam_role_policy_attachment" "s3_read_only" {
  
  role       = aws_iam_role.iam_role[0].name
  policy_arn = data.aws_iam_policy.s3_read_only.arn
}

resource "aws_iam_user" "iam_user" {
  count = var.create_user ? 1 : 0
  name  = var.user_name
}

resource "aws_iam_group" "iam_group" {
  count = var.create_group ? 1 : 0
  name  = var.group_name
}

resource "aws_iam_group_membership" "group_membership" {
  count = var.create_user && var.create_group ? 1 : 0
  name  = "${var.group_name}-membership"
  users = [aws_iam_user.iam_user[0].name]
  group = aws_iam_group.iam_group[0].name
}

resource "aws_iam_group_policy_attachment" "s3_read_only" {
  count      = var.create_group && var.attach_s3_readonly_to_group ? 1 : 0
  group      = aws_iam_group.iam_group[0].name
  policy_arn = data.aws_iam_policy.s3_read_only.arn
}
