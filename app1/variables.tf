#-------------------------------------
# vars for Resource Groups
#-------------------------------------
variable "rg_network" {
  type        = string
  description = "rg name for network resources"
  default     = "rg-vminfotech-nw-weu-01"
}
variable "rg_server" {
  type        = string
  description = "rg name for VMs"
  default     = "rg-vminfotech-srv-weu-02"
}

variable "location" {
  type        = string
  description = "Azure region to deploy all resources"
  default     = "westeurope"
  validation {
    condition     = var.location == "westeurope" || var.location == "northeurope"
    error_message = "Sorry but we only accept location as west or north europe."
  }
}
#-----------------------------------------
# vars for network services. VNET/SNET etc
#-----------------------------------------
variable "vnet_name" {
  type        = string
  description = "name of main vnet for network resources"
  default     = "vnet-vminfotech-weu-01"
}

variable "vnet_cidr" {
  type        = string
  description = "cidr of the vnet"
  default     = "192.169.0.0/22"
}

variable "snet_web_name" {
  type        = string
  description = "web subnet name"
  default     = "snet-web-01"
}

variable "snet_web_cidr" {
  type        = string
  description = "web subnet cidr"
  default     = "192.169.1.0/24"
}

variable "snet_mgmt_name" {
  type        = string
  description = "mgmt subnet name for jumphosts"
  default     = "snet-mgmt-01"
}

variable "snet_mgmt_cidr" {
  type        = string
  description = "mgmt subnet cidr"
  default     = "192.169.2.0/24"
}

variable "snet_db_name" {
  type        = string
  description = "db subnet name"
  default     = "snet-db-01"
}

variable "snet_db_cidr" {
  type        = string
  description = "db subnet cidr"
  default     = "192.169.3.0/24"
}

#-------------------------------------
# vars for VM: jumpbox01
#-------------------------------------
variable "jumpbox_vm_name_01" {
  type        = string
  description = "(optional) describe your variable"
  default     = "jumpbox01"
}

variable "jumpbox_vm_size_01" {
  description = "VM Size"
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Admin Username on VM"
  default     = "azureadmin"
}

variable "admin_password" {
  description = "VM Admin password"
  default     = "Passw0rd#123"
}