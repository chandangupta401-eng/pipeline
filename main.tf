
provider "azurerm" {
  features {
    #depends_on = [azurerm_resource_group.RG1]
  }
}


resource "azurerm_resource_group" "RGPipe" {
  name     = "RG1"
  location = "CentralIndia"
}

resource "azurerm_virtual_network" "vnet" {
  name                = "virtualnetwork"
  resource_group_name = azurerm_resource_group.RGPipe.name
  location            = azurerm_resource_group.RGPipe.location
  address_space       = ["10.0.0.0/16", "192.168.1.0/24"]
}

