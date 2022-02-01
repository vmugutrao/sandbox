#------------------------------
# Define Public IP for Jump box
#------------------------------
resource "azurerm_public_ip" "jumbox01_pip" {
  name                = lower("pip-${var.jumpbox_vm_name_01}")
  resource_group_name = azurerm_resource_group.rgserver.name
  location            = var.location
  allocation_method   = "Static"
}

#-------------------------------------
# Define network i/f card for Jump box
#-------------------------------------
resource "azurerm_network_interface" "jumbox01_nic" {
  name                = lower("nic-${var.jumpbox_vm_name_01}")
  location            = var.location
  resource_group_name = azurerm_resource_group.rgserver.name

  ip_configuration {
    name                          = "internal"
    subnet_id                     = azurerm_subnet.snetmgmt.id
    private_ip_address_allocation = "Dynamic"
    public_ip_address_id          = azurerm_public_ip.jumbox01_pip.id
  }
}

#-------------------------------------
# Define VM : jumpbox01
#-------------------------------------
resource "azurerm_virtual_machine" "jumpbox01" {
  name                  = lower(var.jumpbox_vm_name_01)
  location              = var.location
  resource_group_name   = azurerm_resource_group.rgserver.name
  network_interface_ids = [azurerm_network_interface.jumbox01_nic.id]
  vm_size               = var.jumpbox_vm_size_01

  # Uncomment this line to delete the OS disk automatically when deleting the VM
  delete_os_disk_on_termination = true

  # Uncomment this line to delete the data disks automatically when deleting the VM
  delete_data_disks_on_termination = true

  storage_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "18.04-LTS"
    version   = "latest"
  }
  storage_os_disk {
    name              = "myosdisk1"
    caching           = "ReadWrite"
    create_option     = "FromImage"
    managed_disk_type = "Standard_LRS"
  }
  os_profile {
    computer_name  = var.jumpbox_vm_name_01
    admin_username = var.admin_username
    admin_password = var.admin_password
  }
  os_profile_linux_config {
    disable_password_authentication = false
  }
}