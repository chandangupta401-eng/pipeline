resource "azurerm_resource_group" "RG1" {
  name     = "RGTest"
  location = "CentralIndia"
}

provider "azurerm" {
  features {
    #depends_on = [azurerm_resource_group.RG1]
  }
}