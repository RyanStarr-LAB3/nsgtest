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

# provider block. Configure the Azurerm provider with Service Principal credentials
provider "azurerm" {
  features {}
#  subscription_id = "3593d278-121f-4fec-a50c-2cb628cf6027"
#  tenant_id       = "ff7706a2-9e7b-4760-b237-a553008d17c2"
# client_id       = "524c4acb-fb4d-43d1-a3af-0802a74d31aa"
#  client_secret   = "zf16Dz1bXQoDHj.L_cGbJN8RDPsTsF9L-n"
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