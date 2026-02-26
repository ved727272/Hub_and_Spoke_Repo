rgs = {
  rg1 = {
    name     = "dev-todoapp-rg-ci"
    location = "Central India"
  }
}

stgs = {
  "stg1" = {
    name                     = "devstorage12341212"
    resource_group_name      = "dev-todoapp-rg-ci"
    location                 = "Central India"
    account_tier             = "Standard"
    account_replication_type = "LRS"
    blob_properties = {
      versioning_enabled = true
  } }
}


vnets = {
  hub = {
    name                = "hub-vnet"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    address_space       = ["10.0.0.0/16"]
  }

  spoke = {
    name                = "spoke-vnet"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    address_space       = ["10.1.0.0/16"]
  }
}

subnets = {
  appgw = {
    name                 = "ApplicationGatewaySubnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "hub-vnet"
    address_prefixes     = ["10.0.1.0/24"]
  }

  firewall = {
    name                 = "AzureFirewallSubnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "hub-vnet"
    address_prefixes     = ["10.0.2.0/24"]
  }

  frontend = {
    name                 = "frontend-subnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "spoke-vnet"
    address_prefixes     = ["10.1.1.0/24"]
  }

  backend = {
    name                 = "backend-subnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "spoke-vnet"
    address_prefixes     = ["10.1.2.0/24"]
  }

  database = {
    name                              = "database-subnet"
    resource_group_name               = "dev-todoapp-rg-ci"
    virtual_network_name              = "spoke-vnet"
    address_prefixes                  = ["10.1.3.0/24"]
    private_endpoint_network_policies = "Disabled"
  }
  bastion = {
    name                 = "AzureBastionSubnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "hub-vnet"
    address_prefixes     = ["10.1.4.0/27"]
}
}
subnet_key     = "database"
apw_key        = "appgw"
subnet_apw_key = "appgw"
kv_id          = "kv1"


sqldb = {
  sql_server1 = {
    keyvault_name       = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    sql_username        = "sql-username"
    sql_password        = "sql-password"
    sqlserver_name      = "hubspoke-sqlserver"
    location            = "Central India"
    database_name       = "db1"
  }
}

sqlserver_name      = "hubspoke-sqlserver"
resource_group_name = "dev-todoapp-rg-ci"
location            = "Central India"
# administrator_login          = "adminuser"
# administrator_login_password = "Samsung@1234"
# database_name                = "db1"
pip_name   = "appgw-pip"
appgw_name = "my-appgw"

pe_name         = "sqlserver-pe"
vnet_name_spoke = "spoke-vnet"
vnet_name       = "hub-vnet"
nsgs = {
  frontend = {
    name                = "frontend-nsg"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
  }

  backend = {
    name                = "backend-nsg"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
  }
}

pip = {
  appgw = {
    name                = "appgw-pip"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    allocation_method   = "Static"
    sku                 = "Standard"
  }

  firewall = {
    name                = "firewall-pip"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
  bastion = {
    name                = "bastion-pip"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    allocation_method   = "Static"
    sku                 = "Standard"
  }
}

keyvault = {
  kv1 = {
    key_vault_name      = "hubspoke-kv"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
  }
}

kvs = {
  kv1 = {
    key_vault_name      = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    secret_user         = "sql-username"
    secret_pass         = "adminuser"
  }
  kv2 = {
    key_vault_name      = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    secret_user         = "sql-password"
    secret_pass         = "Samsung@1234"
  }
  kv3 = {
    key_vault_name      = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    secret_user         = "fe-vm-user"
    secret_pass         = "adminuser"
  }

  kv4 = {
    key_vault_name      = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    secret_user         = "be-vm-user"
    secret_pass         = "adminuser"
  }
  kv5 = {
    key_vault_name      = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    secret_user         = "fe-vm-pass"
    secret_pass         = "Samsung@1234"
  }

  kv6 = {
    key_vault_name      = "hubspoke-kv"
    resource_group_name = "dev-todoapp-rg-ci"
    secret_user         = "be-vm-pass"
    secret_pass         = "Samsung@1234"
  }
}

# password = {
#   sqladmin = {
#     password_name = "sql-password"
#     value         = "Samsung@1234"
#   }
# }

nics = {
  nic1 = {
    nic_name             = "nic1"
    subnet_name          = "frontend-subnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "spoke-vnet"
    location             = "Central India"
  }

  nic2 = {
    nic_name             = "nic2"
    subnet_name          = "backend-subnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    virtual_network_name = "spoke-vnet"
    location             = "Central India"
  }
}

vms = {
  fe-vm1 = {
    name                 = "dev-frontend-vm1"
    resource_group_name  = "dev-todoapp-rg-ci"
    location             = "centralindia"
    size                 = "Standard_D2s_v5"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "canonical"
    offer                = "ubuntu-24_04-lts"
    sku                  = "ubuntu-pro-gen1"
    version              = "latest"
    key_vault_name       = "hubspoke-kv"
    secretu_name         = "fe-vm-user"
    secretp_name         = "fe-vm-pass"
    nic_name             = "nic1"
    lun                  = "30"
    disk_name            = "dev-fe-vm1-disk"
    create_option        = "Empty"
    disk_size_gb         = "10"
  }
  be-vm1 = {
    name                 = "dev-backend-vm1"
    resource_group_name  = "dev-todoapp-rg-ci"
    location             = "centralindia"
    size                 = "Standard_D2s_v5"
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
    publisher            = "canonical"
    offer                = "ubuntu-24_04-lts"
    sku                  = "ubuntu-pro-gen1"
    version              = "latest"
    key_vault_name       = "hubspoke-kv"
    secretu_name         = "be-vm-user"
    secretp_name         = "be-vm-pass"
    nic_name             = "nic2"
    lun                  = "30"
    disk_name            = "dev-be-vm1-disk"
    create_option        = "Empty"
    disk_size_gb         = "10"
  }

}

lbs = {
  Ilb1 = {
    name                          = "dev-internal-load-balancer"
    location                      = "centralindia"
    resource_group_name           = "dev-todoapp-rg-ci"
    be_vm_nic_ip_conf_name        = "dev-be-ip2"
    lb_private_ip                 = "10.1.2.30"
    lb_b_pool                     = "dev-be-vm-pool"
    lb_rule_name                  = "dev-lb-rule"
    protocol                      = "Tcp"
    frontend_port                 = 80
    backend_port                  = 8000
    lb_probe_name                 = "dev-prob"
    # lb_probe_port                 = "22"
    lb_probe_port                 = 8000
    be_vm_nic_name                = "nic2"
    subnet_name                   = "backend-subnet"
    virtual_network_name          = "spoke-vnet"
    private_ip_address_allocation = "Static"
    fip_conf_name                 = "lb_ip_conf"
  }
}

firewall = {
  firewall1 = {
    firewall_vnet_name   = "hub-vnet"
    resource_group_name  = "dev-todoapp-rg-ci"
    firewall_subnet_name = "AzureFirewallSubnet"
    firewall_pip_name    = "firewall-pip"
    firewall_name        = "dev-firewall"
    location             = "Central India"
  }
}

log_analytics_workspace = {
  "LAW" = {
    dcr_name            = "data_collection_rule"
    workspace_name      = "LAWorkspace"
    location            = "centralindia"
    resource_group_name = "dev-todoapp-rg-ci"
    retention_in_days   = "30"
    sku                 = "PerGB2018"
    destination_name    = "law-destination"
  }
}

bastion = {
  "bastion1" = {
    bastion_vnet_name   = "hub-vnet"
    resource_group_name = "dev-todoapp-rg-ci"
    bastion_subnet_name = "AzureBastionSubnet"
    bastion_pip_name    = "bastion-pip"
    bastion_name        = "dev-bastion"
    location            = "Central India"

  }
}


route_tables = {
  frontend = {
    route_table_name    = "frontend-udr"
    location            = "Central India"
    firewall_name       = "dev-firewall"
    resource_group_name = "dev-todoapp-rg-ci"
    subnet_name         = "frontend-subnet"
    vnet_name           = "spoke-vnet"
    address_prefix      = "0.0.0.0/0"
    next_hop_type       = "VirtualAppliance"
  }

  backend = {
    route_table_name    = "backend-udr"
    firewall_name       = "dev-firewall"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    subnet_name         = "backend-subnet"
    vnet_name           = "spoke-vnet"
    address_prefix      = "0.0.0.0/0"
    next_hop_type       = "VirtualAppliance"
  }

  database = {
    route_table_name    = "database-udr"
    firewall_name       = "dev-firewall"
    location            = "Central India"
    resource_group_name = "dev-todoapp-rg-ci"
    subnet_name         = "database-subnet"
    vnet_name           = "spoke-vnet"
    address_prefix      = "0.0.0.0/0"
    next_hop_type       = "VirtualAppliance"
  }
}

peerings = {
  hub_to_spoke = {
    source_vnet_name        = "hub-vnet"
    source_rg               = "dev-todoapp-rg-ci"
    remote_vnet_name        = "spoke-vnet"
    remote_rg               = "dev-todoapp-rg-ci"
    allow_forwarded_traffic = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  }

  spoke_to_hub = {
    source_vnet_name        = "spoke-vnet"
    source_rg               = "dev-todoapp-rg-ci"
    remote_vnet_name        = "hub-vnet"
    remote_rg               = "dev-todoapp-rg-ci"
    allow_forwarded_traffic = true
    allow_gateway_transit   = false
    use_remote_gateways     = false
  }
}
