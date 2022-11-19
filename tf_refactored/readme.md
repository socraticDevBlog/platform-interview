# readme

## choices made

### not using Terraform Workspace
I chose not to use _terraform workspace_ to isolate various environments. Since
we deal with various credentials, I think using autonomous tfstate files and
tfvars files is the way to go for this exercise.

### commands ran by automated deployment pipeline*

```bash
terraform init
terraform plan -var-file=terraform.tfvars -out=terraform.plan
terraform apply "teraform.plan"
```

* I assume some remote state file management is being taken care off
