variable "firewall" {
    type = map(object({
      firewall_vnet_name = string
      resource_group_name = string 
      firewall_subnet_name = string
      firewall_pip_name = string
      firewall_name = string
      location = string

    }))
}
