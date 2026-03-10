# Advanced Examples

The file `examples/main_advanced.tf.example` shows a more complex pattern using `for_each` to create multiple users and groups.

Terraform only loads `*.tf` files in the folder where you run it. Since this file is in `examples/` and ends with `.example`, it is NOT active.

To use it:

1. Copy it into the repo root and rename it to end with `.tf`, for example:
   ```bash
   cp examples/main_advanced.tf.example main_advanced.tf
   ```
2. Run Terraform from the repo root.
