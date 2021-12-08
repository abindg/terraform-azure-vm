resource "azurerm_public_ip" "webpubip" {
    name = "${local.resource_name_prefix}-${var.pubipname}"
    resource_group_name = azurerm_resource_group.rsg.name
    location = azurerm_resource_group.rsg.location
    allocation_method = "Dynamic" 
}

resource "azurerm_network_interface" "web_vnic" {
  name = "${local.resource_name_prefix}-${var.vnicname}"
  resource_group_name = azurerm_resource_group.rsg.name
  location = azurerm_resource_group.rsg.location
  ip_configuration {
    name = "internal"
    subnet_id = azurerm_subnet.subnets["${var.webSubnetname}"].id
    private_ip_address_allocation = "Static"
    private_ip_address = var.privateip
    primary = true
    public_ip_address_id = azurerm_public_ip.webpubip.id
  }

}