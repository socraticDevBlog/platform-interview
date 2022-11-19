variable "svc_vault_configs_dev" {
  type = map(object({
    svc_name = string
    db = object({
      user   = string
      passwd = string
    })
  }))
  description = "services config values for Vault resources"
}

variable "svc_vault_configs_staging" {
  type = map(object({
    svc_name = string
    db = object({
      user   = string
      passwd = string
    })
  }))
  description = "services config values for Vault resources"
}

variable "svc_vault_configs_production" {
  type = map(object({
    svc_name = string
    db = object({
      user   = string
      passwd = string
    })
  }))
  description = "services config values for Vault resources"
}

variable "frontend_configs" {
  type = map(object({
    img_version   = string
    external_port = number
  }))
  description = "environment specifications for frontend containers"
}