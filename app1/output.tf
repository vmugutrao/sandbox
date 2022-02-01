output "vnet" {
  value = azurerm_virtual_network.main
}

output "rgnetwork" {
  value = azurerm_resource_group.rgnetwork
}

output "rgserver" {
  value = azurerm_resource_group.rgserver
}

output "snetweb" {
  value = azurerm_subnet.snetweb
}

output "jumpbox01_pip" {
  value = azurerm_public_ip.jumbox01_pip
}