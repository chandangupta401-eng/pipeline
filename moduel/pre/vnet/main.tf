resource "azurerm_virtual_network" "vnet" {
  name                = var.vnet.name
  location            = var.vnet.location
  resource_group_name = var.vnet.resource_group_name
  address_space       = ["10.10.0.0/16"]
}