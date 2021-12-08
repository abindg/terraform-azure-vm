locals {
  subnet_mapping = {
      "${var.webSubnetname}" = "${var.websubnetaddress}"
      "${var.dbsubnetname}" =  "${var.dbsubnetaddress}"
  }
}


resource "azurerm_subnet" "subnets" {
    for_each = local.subnet_mapping
  name = "${local.resource_name_prefix}-${each.key}"
  resource_group_name = azurerm_resource_group.rsg.name
  virtual_network_name = azurerm_virtual_network.myvnet.name
  address_prefixes     = each.value
}