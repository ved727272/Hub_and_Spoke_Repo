data "azurerm_virtual_network" "vnet" {
  for_each            = var.bastion
  name                = each.value.bastion_vnet_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
  for_each             = var.bastion
  name                 = each.value.bastion_subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet[each.key].name
}

data "azurerm_public_ip" "pip" {
  for_each            = var.bastion
  name                = each.value.bastion_pip_name
  resource_group_name = each.value.resource_group_name
}


resource "azurerm_bastion_host" "bastion" {
  for_each            = var.bastion
  name                = each.value.bastion_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}
