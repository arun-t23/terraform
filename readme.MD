# Terraform AWS Examples — Beginner Friendly Guide

This folder contains many small, focused Terraform examples that demonstrate common Terraform features with AWS. Each subfolder is a self-contained example you can run and study. This README explains what each example does, how to run them, and tips to learn safely.

---

## Who is this for
- Beginners who know basic AWS concepts (VPC, EC2, Route53).
- New Terraform users who want hands-on examples: variables, data sources, loops, dynamic blocks, provisioners, and remote state.

---

## Prerequisites (what you need before starting)
1. Install Terraform (recommended v1.x). See https://www.terraform.io/downloads.
2. Install AWS CLI and configure credentials:
   - Run `aws configure` and set AWS Access Key, Secret Key, default region.
   - Or set environment variables: `AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`, `AWS_DEFAULT_REGION`.
3. Basic command-line knowledge (PowerShell or Command Prompt on Windows).

---

## How to use an example (step-by-step)
1. Open a terminal and change directory into the example you want to run, for example:
   - PowerShell:
     ```pwsh
     cd '<DIRECTORY>'
     ```
2. Inspect the files: `provider.tf`, `variables.tf`, `<resource>.tf` to understand what will be created.
3. Initialize the working directory (downloads provider plugins):
   ```sh
   terraform init
   ```
4. (Optional) Fill in variables:
   - Either edit `terraform.tfvars` (if present), or
   - Pass variables on the command line: `terraform apply -var="vpc_id=vpc-12345"`, or
   - Use environment variables `TF_VAR_<name>`.
5. See what Terraform will do:
   ```sh
   terraform plan
   ```
6. Apply the changes (create resources):
   ```sh
   terraform apply
   ```
   - Confirm with `yes` when prompted, or use `-auto-approve`.
7. When done, destroy resources to avoid charges:
   ```sh
   terraform destroy
   ```

Important: Running these examples will create real AWS resources that might cost money. Always `terraform destroy` after testing.

---

## Folder index — what each example demonstrates

Each folder is a small lesson. Open the `.tf` files to read comments and variable descriptions.

- conditions/
  - Teaches conditional resource creation using `count` or conditional expressions.
  - Files: `provider.tf` (provider config), `variables.tf`, `ec2.tf` (EC2 resource created only when a variable is set).
  - Learn: how to create or skip resources programmatically.

- count-loop/
  - Demonstrates the `count` meta-argument for repeating resources (e.g., multiple EC2 instances or Route53 records).
  - Files: `ec2.tf`, `route53.tf`, `variables.tf`.
  - Learn: indexed references like `aws_instance.example[count.index]`.

- data-source/
  - Shows how to use `data` blocks to look up existing AWS resources (AMIs, VPCs, subnets).
  - Files: `data.tf` (data lookups) and `ec2.tf` (using those lookups).
  - Learn: reusing existing infra instead of recreating it.

- dynamic/
  - Demonstrates `dynamic` blocks to generate nested blocks (useful for security group rules).
  - Files: `dynamic.tf`, `sg.tf`.
  - Learn: building flexible resource configurations from lists or maps.

- ec2/
  - Basic EC2 launch example.
  - Files: `provider.tf`, `ec2.tf`.
  - Learn: minimum configuration to create an EC2 instance.

- for-loop/
  - Demonstrates `for_each` and `for` expressions to iterate over maps/lists.
  - Files: `ec2.tf`, `route53.tf`, `variables.tf`.
  - Learn: better alternatives to `count` when using maps or named resources.

- local/
  - Shows how to use `locals` for computed values (names, tags) and to avoid repeating expressions.
  - Files: `local.tf`, `data.tf`, `ec2.tf`.
  - Learn: organize common computed values centrally.

- provisioner_remote_exec/
  - Demonstrates `remote-exec` provisioner to run commands on created EC2 instances.
  - Files: `ec2.tf`, `inventory`.
  - Learn: run configuration commands over SSH after instance creation (use sparingly; prefer configuration management or image baking).

- provisioners_local_exec/
  - Demonstrates `local-exec` provisioner to run local scripts/commands during apply.
  - Files: `ec2.tf`, `inventory`.
  - Learn: launching local scripts as part of apply (use with caution).

- remote-state/
  - Shows accessing remote Terraform state (useful for splitting infrastructure into modules/projects).
  - Files: `ec2.tf`, `provider.tf`.
  - Learn: `terraform_remote_state` data source pattern.

- variables/
  - Basic example of using variables to parameterize resources.
  - Files: `variables.tf`, `ec2.tf`.
  - Learn: `terraform.tfvars`, variable types, defaults.

---

## Learning path (recommended)
1. Start with `variables/` and `ec2/` to learn basic provider and resource blocks.
2. Move to `local/` to learn how locals simplify code.
3. Try `count-loop/` and `for-loop/` to understand creating multiple resources.
4. Study `data-source/` to integrate existing AWS resources.
5. Explore `dynamic/` for advanced block generation.
6. Try provisioners examples only after understanding immutable infrastructure practices.
7. Learn `remote-state/` when splitting projects across teams.

---

## Common commands cheat-sheet
- terraform init — initialize
- terraform plan — preview changes
- terraform apply — apply changes
- terraform destroy — remove resources
- terraform fmt — format files
- terraform validate — check config syntax and types
- terraform output — show module outputs

---

## Tips & best practices
- Never keep long-lived AWS credentials in the repo.
- Use a separate AWS account or a sandbox for experiments.
- Prefer using modules and immutable AMIs over provisioners for long-term infra.
- Store real project state remotely (S3 + DynamoDB for locking) — examples use local state for learning.
- Read resource and provider docs when uncertain: https://registry.terraform.io/

---

## Troubleshooting (quick)
- "Provider not installed" — run `terraform init`.
- "Insufficient permissions" — check IAM permissions for credentials.
- "Invalid value for variable" — check types and defaults in `variables.tf`.
- Resources not destroyed? Check dependencies and run `terraform destroy -target=<resource>` if needed.

---

## Where to go next
- Official Terraform Learn: https://learn.hashicorp.com/terraform
- AWS Provider docs: https://registry.terraform.io/providers/hashicorp/aws/latest/docs
- Practice by modifying examples: change AMI, instance type, add tags, or add security group rules.

---

