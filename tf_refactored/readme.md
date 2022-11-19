# readme

## choices made

### not using Terraform Workspace
I chose not to use _terraform workspace_ to isolate various environments.

### looping over services

over time, the most changes will probably be adding more services. looping over a list of services will make this change easier. no need to re-open  codebase.

### commands ran by automated deployment pipeline*

```bash
terraform init
terraform plan -var-file=terraform.tfvars -out=terraform.plan
terraform apply "terraform.plan"
```

* I assume some remote state file management is being taken care off
