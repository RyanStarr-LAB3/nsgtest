# terraform block
terraform {
  required_version = ">=1.0"
#  backend "azurerm" {}

  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = ">=2.67.0"
    }
  }
}

# provider block. auth via cli
provider "azurerm" {
  features {}
}

#create nsg
resource "azurerm_network_security_group" "nsg1" {
  name                = "nsgruletest1"
  location            = "Australia Southeast"
  resource_group_name = "Ryan-Dev"
}

# module block. nsg module
module "nsg" {
  source = "./modules/nsg"
}