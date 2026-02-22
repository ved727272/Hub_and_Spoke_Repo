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
