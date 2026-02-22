variable "rgs" {
  type = map(object({
    name       = string
    location   = string
    managed_by = optional(string)
  }))
}

variable "stgs" {
  type = map(object({
    name                     = string
    resource_group_name      = string
    location                 = string
    account_tier             = string
    account_replication_type = string
    account_kind             = optional(string)
    access_tier              = optional(string)
    edge_zone                = optional(string)

    https_traffic_only_enabled        = optional(bool)
    min_tls_version                   = optional(string)
    allow_nested_items_to_be_public   = optional(bool)
    shared_access_key_enabled         = optional(bool)
    public_network_access_enabled     = optional(bool)
    cross_tenant_replication_enabled  = optional(bool)
    infrastructure_encryption_enabled = optional(bool)

    is_hns_enabled           = optional(bool)
    nfsv3_enabled            = optional(bool)
    sftp_enabled             = optional(bool)
    large_file_share_enabled = optional(bool)
    local_user_enabled       = optional(bool)

    dns_endpoint_type = optional(string)

    identity = optional(object({
      type         = string
      identity_ids = optional(list(string))
    }))

    network_rules = optional(object({
      default_action             = string
      bypass                     = optional(list(string))
      ip_rules                   = optional(list(string))
      virtual_network_subnet_ids = optional(list(string))
    }))

    static_website = optional(object({
      index_document     = optional(string)
      error_404_document = optional(string)
    }))

    routing = optional(object({
      choice                      = optional(string)
      publish_internet_endpoints  = optional(bool)
      publish_microsoft_endpoints = optional(bool)
    }))

    blob_properties = optional(object({
      versioning_enabled       = optional(bool)
      change_feed_enabled      = optional(bool)
      last_access_time_enabled = optional(bool)

      delete_retention_policy = optional(object({
        days = number
      }))

      container_delete_retention_policy = optional(object({
        days = number
      }))
    }))

    share_properties = optional(object({
      retention_policy = optional(object({
        days = number
      }))
    }))

    queue_properties = optional(object({
      logging = optional(object({
        read    = bool
        write   = bool
        delete  = bool
        version = string
      }))
    }))

    tags = optional(map(string))
  }))
}



variable "vnets" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    address_space       = list(string)
  }))
}

variable "subnets" {
  type = map(object({
    name                              = string
    resource_group_name               = string
    virtual_network_name              = string
    address_prefixes                  = list(string)
    private_endpoint_network_policies = optional(string, "Enabled")
  }))
}


variable "sqldb" {
  type = map(object({
    keyvault_name       = string
    resource_group_name = string
    sql_username        = string
    sql_password        = string
    sqlserver_name      = string
    location            = string
    database_name       = string

  }))
}
variable "resource_group_name" {}
variable "sqlserver_name" {}
variable "location" {}

variable "pip_name" {}

variable "appgw_name" {}




variable "pe_name" {}
variable "subnet_key" {}
variable "apw_key" {}
variable "subnet_apw_key" {}
variable "kv_id" {}

variable "vnet_name" {}
variable "vnet_name_spoke" {}


variable "nsgs" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
  }))
}

variable "pip" {
  type = map(object({
    name                = string
    location            = string
    resource_group_name = string
    allocation_method   = string
    sku                 = string
  }))
}

variable "keyvault" {
  type = map(object({
    key_vault_name      = string
    location            = string
    resource_group_name = string

  }))

}

variable "kvs" {
  type = map(object({
    key_vault_name      = string
    resource_group_name = string
    secret_user         = string
    secret_pass         = string

  }))

}
# variable "password" {
#   type = map(object({
#     password_name = string
#     value         = string
#   }))

# }
# variable "username" {
#   type = map(object({
#     username = string
#     value    = string
#   }))
# }

variable "nics" {
  type = map(object({
    nic_name             = string
    subnet_name          = string
    resource_group_name  = string
    virtual_network_name = string
    location             = string
  }))
}

variable "vms" {
  type = map(object({
    name                 = string
    resource_group_name  = string
    location             = string
    size                 = string
    caching              = string
    storage_account_type = string
    publisher            = string
    offer                = string
    sku                  = string
    version              = string
    key_vault_name       = string
    secretu_name         = string
    secretp_name         = string
    nic_name             = string
    lun                  = string
    disk_name            = string
    create_option        = string
    disk_size_gb         = string

  }))
}

variable "lbs" {
  type = map(object({
    name                          = string
    location                      = string
    resource_group_name           = string
    fip_conf_name                 = string
    lb_b_pool                     = string
    lb_rule_name                  = string
    protocol                      = string
    frontend_port                 = number
    backend_port                  = number
    lb_probe_name                 = string
    lb_probe_port                 = string
    be_vm_nic_name                = string
    lb_private_ip                 = string
    subnet_name                   = string
    virtual_network_name          = string
    private_ip_address_allocation = string
    be_vm_nic_ip_conf_name        = string
  }))
}

variable "firewall" {
  type = map(object({
    firewall_vnet_name   = string
    resource_group_name  = string
    firewall_subnet_name = string
    firewall_pip_name    = string
    firewall_name        = string
    location             = string

  }))
}

variable "log_analytics_workspace" {
  type = map(object({
    workspace_name      = string
    location            = string
    resource_group_name = string
    sku                 = string
    retention_in_days   = string
    dcr_name            = string
    destination_name    = string
  }))
}



variable "bastion" {
  type = map(object({
    bastion_vnet_name   = string
    resource_group_name = string
    bastion_subnet_name = string
    bastion_pip_name    = string
    bastion_name        = string
    location            = string
  }))

}

variable "route_tables" {
  type = map(object({
    route_table_name    = string
    firewall_name       = string
    location            = string
    resource_group_name = string
    subnet_name         = string
    vnet_name           = string
    address_prefix      = string
    next_hop_type       = string
  }))
}

variable "peerings" {
  type = map(object({
    source_vnet_name        = string
    source_rg               = string
    remote_vnet_name        = string
    remote_rg               = string
    allow_forwarded_traffic = bool
    allow_gateway_transit   = bool
    use_remote_gateways     = bool
  }))
}
