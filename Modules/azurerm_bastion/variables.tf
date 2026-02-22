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
