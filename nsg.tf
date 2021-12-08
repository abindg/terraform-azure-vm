locals {
  nsg_mapping = {
      "${var.webnsg}" = "${var.webSubnetname}"
      "${var.dbnsg}" = "${var.dbsubnetname}"
  }
}
# Creating network security groups

resource "azurerm_network_security_group" "nsg" {
 for_each = local.nsg_mapping
  name = "${local.resource_name_prefix}-${each.key}"
  location = azurerm_resource_group.rsg.location
  resource_group_name = azurerm_resource_group.rsg.name
}
  #Associating Subnet with network security groups 

  resource "azurerm_subnet_network_security_group_association" "nsgsubnetassociation" {
    for_each = local.nsg_mapping
  subnet_id                 = azurerm_subnet.subnets["${each.value}"].id
  network_security_group_id = azurerm_network_security_group.nsg["${each.key}"].id
  depends_on = [
    azurerm_network_security_rule.web-security-rule,
    azurerm_network_security_rule.db-security-rule  
  ]
  }

  
# Creating Security rules
  locals {
    portmapping = {
      100 : 22
      110 : 80
      200 : 443
    }
  }
  
  resource "azurerm_network_security_rule" "web-security-rule" {
    for_each = local.portmapping
  name                        = "Sec-Rule-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rsg.name
  network_security_group_name = azurerm_network_security_group.nsg["${var.webnsg}"].name
}

resource "azurerm_network_security_rule" "db-security-rule" {
    for_each = local.portmapping
  name                        = "Sec-Rule-${each.value}"
  priority                    = each.key
  direction                   = "Inbound"
  access                      = "Allow"
  protocol                    = "Tcp"
  source_port_range           = "*"
  destination_port_range      = each.value
  source_address_prefix       = "*"
  destination_address_prefix  = "*"
  resource_group_name         = azurerm_resource_group.rsg.name
  network_security_group_name = azurerm_network_security_group.nsg["${var.dbnsg}"].name
}


