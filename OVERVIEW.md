# Overview

This Terraform project can create:

- An IAM role with a random suffix in its name
- An IAM user
- An IAM group
- Optional AmazonS3ReadOnlyAccess attachments to the role or group

You can enable or disable each resource using the `create_*` variables.
