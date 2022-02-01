resource "azurerm_subnet" "snetweb" {
  name                 = var.snet_web_name
  resource_group_name  = azurerm_resource_group.rgnetwork.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.snet_web_cidr]
}
resource "azurerm_subnet" "snetmgmt" {
  name                 = var.snet_mgmt_name
  resource_group_name  = azurerm_resource_group.rgnetwork.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.snet_mgmt_cidr]
}
resource "azurerm_subnet" "snetdb" {
  name                 = var.snet_db_name
  resource_group_name  = azurerm_resource_group.rgnetwork.name
  virtual_network_name = azurerm_virtual_network.main.name
  address_prefixes     = [var.snet_db_cidr]
}