resource "azurerm_virtual_network" "myvnet" {
  name = "${local.resource_name_prefix}-${var.vnetname}"
  location = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
  address_space = var.vnetaddress
}