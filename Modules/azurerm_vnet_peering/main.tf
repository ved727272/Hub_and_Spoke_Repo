data "azurerm_virtual_network" "source" {
  for_each = var.peerings
  name                = each.value.source_vnet_name
  resource_group_name = each.value.source_rg
}

data "azurerm_virtual_network" "remote" {
  for_each = var.peerings
  name                = each.value.remote_vnet_name
  resource_group_name = each.value.remote_rg
}

resource "azurerm_virtual_network_peering" "peering" {
  for_each = var.peerings

  name                      = "${each.key}-peering"
  resource_group_name       = each.value.source_rg
  virtual_network_name      = data.azurerm_virtual_network.source[each.key].name
  remote_virtual_network_id = data.azurerm_virtual_network.remote[each.key].id

  allow_forwarded_traffic = each.value.allow_forwarded_traffic
  allow_gateway_transit   = each.value.allow_gateway_transit
  use_remote_gateways     = each.value.use_remote_gateways
}