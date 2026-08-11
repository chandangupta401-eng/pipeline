
provider "azurerm" {
  features {
    #depends_on = [azurerm_resource_group.RG1]
  }
}

# resource "azurerm_resource_group" "RGPipe" {
#   name     = "RG2"
#   location = "CentralIndia"
# }

resource "azurerm_resource_group" "RGPipe" {
  name     = "RG3"
  location = "CentralIndia"
}


# resource "azurerm_virtual_network" "vnet" {
#   name                = "virtualnetwork"
#   resource_group_name = azurerm_resource_group.RGPipe.name
#   location            = azurerm_resource_group.RGPipe.location
#   address_space       = ["10.0.0.0/16", "192.168.1.0/24"]
# }

# resource "azurerm_subnet" "sub" {
#   name                 = "sub"
#   resource_group_name  = azurerm_resource_group.RGPipe.name
#   virtual_network_name = azurerm_virtual_network.vnet.name
#   address_prefixes     = ["10.0.10.0/24"]
# }