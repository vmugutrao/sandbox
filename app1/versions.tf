#----Tell terraform to use Azure provider
terraform {
  required_providers {
    azurerm = {
      source = "hashicorp/azurerm"
    }
  }
  backend "azurerm" {
    resource_group_name  = "master-rg"
    storage_account_name = "vminfotech"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}

#----Tell terraform to use Az cli auth
provider "azurerm" {
  features {
  }
}