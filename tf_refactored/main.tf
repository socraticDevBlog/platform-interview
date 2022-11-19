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

module "infra_development" {
  source = "./infra_module"
  vault_provider = {
    address = "http://localhost:${var.vault_provider_conf["non-production"].port}"
    token   = var.vault_provider_conf["non-production"].token
  }
  env                        = "development"
  svc_vault_configs          = var.svc_vault_configs_dev
  frontend_container_configs = var.frontend_configs["non-production"]
}

module "infra_staging" {
  source = "./infra_module"
  vault_provider = {
    address = "http://localhost:${var.vault_provider_conf["non-production"].port}"
    token   = var.vault_provider_conf["non-production"].token
  }
  env                        = "staging"
  svc_vault_configs          = var.svc_vault_configs_staging
  frontend_container_configs = var.frontend_configs["non-production"]

}

module "infra_production" {
  source = "./infra_module"
  vault_provider = {
    address = "http://localhost:${var.vault_provider_conf["production"].port}"
    token   = var.vault_provider_conf["production"].token
  }
  env                        = "production"
  svc_vault_configs          = var.svc_vault_configs_production
  frontend_container_configs = var.frontend_configs["production"]
}