terraform {
  backend "azurerm" {
    resource_group_name  = "RG"
    storage_account_name = "storagetest10aug26"
    container_name       = "blob"
    key                  = "terraform.tfstate"
  }
}