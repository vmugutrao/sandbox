#------------------
# NSG definitions
#------------------
resource "azurerm_network_security_group" "nsgmgmt" {
  name                = lower("nsg-${var.snet_mgmt_name}")
  location            = var.location
  resource_group_name = azurerm_resource_group.rgnetwork.name
}

resource "azurerm_network_security_group" "nsgweb" {
  name                = lower("nsg-${var.snet_web_name}")
  location            = var.location
  resource_group_name = azurerm_resource_group.rgnetwork.name
}

resource "azurerm_network_security_group" "nsgdb" {
  name                = lower("nsg-${var.snet_db_name}")
  location            = var.location
  resource_group_name = azurerm_resource_group.rgnetwork.name
}

#-----------------------
# Attach NSGs to Subnets
#-----------------------
resource "azurerm_subnet_network_security_group_association" "nsg-snet-mgmt" {
  subnet_id                 = azurerm_subnet.snetmgmt.id
  network_security_group_id = azurerm_network_security_group.nsgmgmt.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-snet-web" {
  subnet_id                 = azurerm_subnet.snetweb.id
  network_security_group_id = azurerm_network_security_group.nsgweb.id
}

resource "azurerm_subnet_network_security_group_association" "nsg-snet-db" {
  subnet_id                 = azurerm_subnet.snetdb.id
  network_security_group_id = azurerm_network_security_group.nsgdb.id
}