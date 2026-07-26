# terraform-task

Terraform code for deploying web server instances into AWS (eu-west-2).

## Usage

terraform init
terraform plan
terraform apply

## Structure

- conf.tf          - provider and version config
- variables.tf     - shared variables
- deploy_vpc.tf    - VPC, subnet, internet gateway, routing
- deploy_dev.tf    - dev instances and security group
- deploy_prod.tf   - prod instances and security group
