#----Creating a resourceGroup for network resources
resource "azurerm_resource_group" "rgnetwork" {
  name     = var.rg_network
  location = var.location
}

#----Creating a resourceGroup for server resources
resource "azurerm_resource_group" "rgserver" {
  name     = var.rg_server
  location = var.location
}