variable "vault_provider" {
  type = object({
    address = string
    token   = string
  })
  description = "config values for Vault provider block"
}

variable "env" {
  description = "name of the environment"
  type        = string
}

variable "svc_vault_configs" {
  type = map(object({
    svc_name = string
    db = object({
      user   = string
      passwd = string
    })
  }))
  description = "services config values for Vault resources"
}

variable "frontend_container_configs" {
  type = object({
    img_version   = string
    external_port = number
  })
}
