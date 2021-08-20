# terraform block
# !important! the first column of the locals csv does not work (possible bug), so there is a 2nd column for the rule name
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
resource "azurerm_network_security_group" "nsg" {
  name                = "nsgruletest"
  location            = "Australia Southeast"
  resource_group_name = "Ryan-Dev"
}

#define locals (a csv file of nsg rules)
locals {
  nsg_rules = csvdecode(file("./rules.csv"))
}

#create nsg rules from locals csv file
resource "azurerm_network_security_rule" "nsgrules" {
  count = length(local.nsg_rules)

  name                        = local.nsg_rules[count.index].rule_name
  priority                    = local.nsg_rules[count.index].priority
  direction                   = local.nsg_rules[count.index].direction
  access                      = local.nsg_rules[count.index].access
  protocol                    = local.nsg_rules[count.index].protocol  
  source_port_range           = local.nsg_rules[count.index].source_port_range
  destination_port_range      = local.nsg_rules[count.index].destination_port_range 
  source_address_prefix       = local.nsg_rules[count.index].source_address_prefix
  destination_address_prefix  = local.nsg_rules[count.index].destination_address_prefix
  resource_group_name         = "Ryan-Dev"
  network_security_group_name = azurerm_network_security_group.nsg.name
}