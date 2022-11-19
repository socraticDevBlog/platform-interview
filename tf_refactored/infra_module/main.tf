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

provider "vault" {
  address = var.vault_provider.address
  token   = var.vault_provider.token
}

resource "vault_audit" "audit" {
  type = "file"

  options = {
    file_path = "/vault/logs/audit"
  }
}

resource "vault_auth_backend" "auth" {
  type = "userpass"
}

resource "vault_generic_secret" "svc_secrets" {
  for_each = var.svc_vault_configs

  path      = "secret/${var.env}/${each.value.svc_name}"
  data_json = jsonencode(each.value.db)
}

resource "vault_policy" "svc_policies" {
  for_each = var.svc_vault_configs

  name = "${each.value.svc_name}-${var.env}"

  policy = <<EOT
    path "secret/data/${var.env}/${each.value.svc_name}" {
        capabilities = ["list", "read"]
    }
EOT
}

resource "vault_generic_endpoint" "svc_endpoints" {
  depends_on = [vault_auth_backend.auth]
  for_each   = var.svc_vault_configs

  path                 = "auth/userpass/users/${each.value.svc_name}-${var.env}"
  ignore_absent_fields = true

  data_json = <<EOT
    {
    "policies": ["${each.value.svc_name}-${var.env}"],
    "password": "123-${each.value.svc_name}-${var.env}"
    }
    EOT
}

resource "docker_container" "svc_containers" {
  for_each = var.svc_vault_configs

  image = "form3tech-oss/platformtest-${each.value.svc_name}"
  name  = "${each.value.svc_name}_${var.env}"

  env = [
    "VAULT_ADDR=http://vault-${var.env}:8200",
    "VAULT_USERNAME=${each.value.svc_name}-${var.env}",
    "VAULT_PASSWORD=123-${each.value.svc_name}-${var.env}",
    "ENVIRONMENT=${var.env}"
  ]

  networks_advanced {
    name = "vagrant_${var.env}"
  }

  lifecycle {
    ignore_changes = all
  }
}

resource "docker_container" "frontend_containers" {
  image = "docker.io/nginx:${var.frontend_container_configs.img_version}"
  name  = "frontend_${var.env}"

  ports {
    internal = 80
    external = var.frontend_container_configs.external_port
  }

  networks_advanced {
    name = "vagrant_${var.env}"
  }

  lifecycle {
    ignore_changes = all
  }
}