data "azurerm_network_interface" "nicdata" {
  for_each            = var.lbs
  name                = each.value.be_vm_nic_name
  resource_group_name = each.value.resource_group_name
}
data "azurerm_subnet" "subnet_data" {
  for_each             = var.lbs
  name                 = each.value.subnet_name
  virtual_network_name = each.value.virtual_network_name
  resource_group_name  = each.value.resource_group_name
}
