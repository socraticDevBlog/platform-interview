# readme

## choices made

### not using Terraform Workspace
I chose not to use _terraform workspace_ to isolate various environments.

### commands ran by automated deployment pipeline*

```bash
terraform init
terraform plan -var-file=terraform.tfvars -out=terraform.plan
terraform apply "terraform.plan"
```

* I assume some remote state file management is being taken care off
