vault_provider_conf = {
  "non-production" = {
    port  = "8201"
    token = "f23612cf-824d-4206-9e94-e31a6dc8ee8d"
  }
  "production" = {
    port  = "8301"
    token = "083672fc-4471-4ec4-9b59-a285e463a973"
  }
}

svc_vault_configs_dev = {
  "account" = {
    db = {
      user   = "account"
      passwd = "965d3c27-9e20-4d41-91c9-61e6631870e7"
    }
    svc_name = "account"
  }
  "gateway" = {
    db = {
      user   = "gateway"
      passwd = "10350819-4802-47ac-9476-6fa781e35cfd"
    }
    svc_name = "gateway"
  }
  "payment" = {
    db = {
      user   = "payment"
      passwd = "a63e8938-6d49-49ea-905d-e03a683059e7"
    }
    svc_name = "payment"
  }
}

# same values as dev
svc_vault_configs_staging = {
  "account" = {
    db = {
      user   = "account"
      passwd = "965d3c27-9e20-4d41-91c9-61e6631870e7"
    }
    svc_name = "account"
  }
  "gateway" = {
    db = {
      user   = "gateway"
      passwd = "10350819-4802-47ac-9476-6fa781e35cfd"
    }
    svc_name = "gateway"
  }
  "payment" = {
    db = {
      user   = "payment"
      passwd = "a63e8938-6d49-49ea-905d-e03a683059e7"
    }
    svc_name = "payment"
  }
}

svc_vault_configs_production = {
  "account" = {
    db = {
      user   = "account"
      passwd = "396e73e7-34d5-4b0a-ae1b-b128aa7f9977"
    }
    svc_name = "account"
  }
  "gateway" = {
    db = {
      user   = "gateway"
      passwd = "33fc0cc8-b0e3-4c06-8cf6-c7dce2705329"
    }
    svc_name = "gateway"
  }
  "payment" = {
    db = {
      user   = "payment"
      passwd = "821462d7-47fb-402c-a22a-a58867602e39"
    }
    svc_name = "payment"
  }
}

frontend_configs = {
  "non-production" = {
    img_version   = "latest"
    external_port = 4080
  }
  "production" = {
    img_version   = "1.22.0-alpine"
    external_port = 4081
  }
}
