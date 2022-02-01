#----Creating a vnet main for all the network resources
resource "azurerm_virtual_network" "main" {
  name                = var.vnet_name
  location            = var.location
  resource_group_name = azurerm_resource_group.rgnetwork.name
  address_space       = [var.vnet_cidr]
}