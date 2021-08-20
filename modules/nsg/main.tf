locals {
  nsgrules = csvdecode(file("$./rules.csv"))
}

resource "azurerm_network_security_rule" "nsg" {
  for_each                    = local.nsgrules 

  name                        = each.value.name
  priority                    = each.value.priority
  direction                   = each.value.direction
  access                      = each.value.access
  protocol                    = each.value.protocol
  source_port_range           = each.value.source_port_range
  destination_port_range      = each.value.destination_port_range
  source_address_prefix       = each.value.source_address_prefix
  destination_address_prefix  = each.value.destination_address_prefix
  resource_group_name         = "Ryan-Dev"
  network_security_group_name = "nsgruletest1"
}