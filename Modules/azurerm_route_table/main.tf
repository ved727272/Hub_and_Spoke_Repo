data "azurerm_subnet" "subnet" {
  for_each = var.route_tables

  name                 = each.value.subnet_name
  virtual_network_name = each.value.vnet_name
  resource_group_name  = each.value.resource_group_name
}

data "azurerm_firewall" "fw" {
    for_each = var.route_tables
  name                = each.value.firewall_name
  resource_group_name = each.value.resource_group_name
}



resource "azurerm_route_table" "rt" {
  for_each = var.route_tables

  name                = each.value.route_table_name
  location            = each.value.location
  resource_group_name = each.value.resource_group_name
}

resource "azurerm_route" "default" {
  for_each = var.route_tables

  name                   = "default-route"
  resource_group_name    = each.value.resource_group_name
  route_table_name       = azurerm_route_table.rt[each.key].name
  address_prefix         = each.value.address_prefix
  next_hop_type          = each.value.next_hop_type
  next_hop_in_ip_address = data.azurerm_firewall.fw[each.key].ip_configuration[0].private_ip_address
}

resource "azurerm_subnet_route_table_association" "assoc" {
  for_each = var.route_tables

  subnet_id      = data.azurerm_subnet.subnet[each.key].id
  route_table_id = azurerm_route_table.rt[each.key].id
}