data "azurerm_virtual_network" "vnet" {
    for_each = var.firewall
  name                = each.value.firewall_vnet_name
  resource_group_name = each.value.resource_group_name
}

data "azurerm_subnet" "subnet" {
    for_each = var.firewall
  name                 = each.value.firewall_subnet_name
  resource_group_name  = each.value.resource_group_name
  virtual_network_name = data.azurerm_virtual_network.vnet[each.key].name
}

data "azurerm_public_ip" "pip" {
for_each = var.firewall
  name                = each.value.firewall_pip_name
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_firewall" "firewall" {
    for_each = var.firewall
  name                = each.value.firewall_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
  sku_name            = "AZFW_VNet"
  sku_tier            = "Standard"

  ip_configuration {
    name                 = "configuration"
    subnet_id            = data.azurerm_subnet.subnet[each.key].id
    public_ip_address_id = data.azurerm_public_ip.pip[each.key].id
  }
}