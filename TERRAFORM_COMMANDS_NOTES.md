# Terraform Commands Notes

## Core commands

- `terraform init`: Initialize the working directory and download required providers.
- `terraform plan`: Show the changes Terraform *would* make (no changes applied).
- `terraform apply`: Apply the planned changes.
- `terraform destroy`: Destroy all resources tracked in the current state. (It destroys using state file, when apply works it writes resource ids locally, using thos resource ids terraform destroys those ids.)

## Example outputs by command

### `terraform init`

Typical output :

```text
Initializing the backend...
Initializing provider plugins...
- Finding hashicorp/aws versions matching "~> 5.0"...
- Finding hashicorp/random versions matching "~> 3.0"...
Terraform has been successfully initialized!
```

### `terraform plan`

Typical output :

```text
Terraform will perform the following actions:
  # aws_iam_role.iam_role[0] will be created
  + resource "aws_iam_role" "iam_role" { ... }
Plan: 1 to add, 0 to change, 0 to destroy.
```

### `terraform apply`

Typical output :

```text
Apply complete! Resources: 1 added, 0 changed, 0 destroyed.

Outputs:

iam_role_name = "iam-terraform-role-3f9a1c"
iam_user_name = null
iam_group_name = null
```

### `terraform destroy`

Typical output :

```text
Destroy complete! Resources: 1 destroyed.
```

Note: The exact resources and counts depend on your `create_*` variables.

## Useful flags

- `-var "key=value"`: Override a variable for this run.
- `-var-file="file.tfvars"`: Load variables from a file.
- `-target=resource.type.name`: Apply only a specific resource (use sparingly).

## File loading behavior

Terraform automatically loads **all** `*.tf` files in the current directory. The file name does **not** need to be `main.tf`.
It uses blocks like resource variable to fetch all the information.

Example valid names:

- `main.tf`
- `iam.tf`
- `users.tf`
