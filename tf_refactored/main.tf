terraform {
  required_version = ">= 1.0.7"

  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "2.15.0"
    }

    vault = {
      version = "3.0.1"
    }
  }
}

locals {
  non_prod_port  = "8201"
  prod_port      = "8301"
  non_prod_token = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
  prod_token     = "083672fc-4471-4ec4-9b59-a285e463a973"
}

module "infra_development" {
  source = "./infra_module"
  vault_provider = {
    address = "http://localhost:${local.non_prod_port}"
    token   = local.non_prod_token
  }
  env                        = "development"
  svc_vault_configs          = var.svc_vault_configs_dev
  frontend_container_configs = var.frontend_configs["non-production"]
}

module "infra_staging" {
  source = "./infra_module"
  vault_provider = {
    address = "http://localhost:${local.non_prod_port}"
    token   = local.non_prod_token
  }
  env                        = "staging"
  svc_vault_configs          = var.svc_vault_configs_staging
  frontend_container_configs = var.frontend_configs["non-production"]

}

module "infra_production" {
  source = "./infra_module"
  vault_provider = {
    address = "http://localhost:${local.prod_port}"
    token   = local.prod_token
  }
  env                        = "production"
  svc_vault_configs          = var.svc_vault_configs_production
  frontend_container_configs = var.frontend_configs["production"]
}