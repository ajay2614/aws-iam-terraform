# Terraform Core Syntax (Only Terraform Concepts)

This file explains Terraform-specific blocks and keywords (not general types like list/map/toset).

## `terraform` block

Declares required Terraform version and providers.

```hcl
terraform {
  required_version = ">= 1.5.0"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}
```

## `provider` block

Configures how Terraform connects to a system (AWS, in this repo).

```hcl
provider "aws" {
  region = var.aws_region
}
```

## `resource` block

Creates and manages a real infrastructure object.

```hcl
resource "aws_iam_role" "iam_role" {
  name = "example-role"
}
```

Format: `resource "TYPE" "NAME" { ... }`

## `data` block

Reads existing information from a provider (does not create).

```hcl
data "aws_iam_policy" "s3_read_only" {
  arn = "arn:aws:iam::aws:policy/AmazonS3ReadOnlyAccess"
}
```

## `variable` block

Defines an input you can override when running Terraform.

```hcl
variable "aws_region" {
  type    = string
  default = "us-east-1"
}
```

You reference it as: `var.aws_region`.

## `output` block

Prints values after `terraform apply`.

```hcl
output "iam_role_name" {
  value = aws_iam_role.iam_role[0].name
}
```

## `locals` block

Defines local named values for reuse (not inputs, not outputs).

```hcl
locals {
  role_name = "my-role"
}
```

Reference as: `local.role_name`.

## `module` block

Uses a reusable Terraform module.

```hcl
module "iam" {
  source = "./modules/iam"
}
```

## Meta-arguments (`count`, `for_each`, `depends_on`)

Special Terraform-only arguments that control resource creation.

- `count`: create 0 or more copies
- `for_each`: create one per item in a collection
- `depends_on`: force creation order
