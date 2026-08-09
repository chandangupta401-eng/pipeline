terraform {
  backend "azurerm" {
    resource_group_name  = "day5"
    storage_account_name = "iinspirabb8787jj"
    container_name       = "tfstate"
    key                  = "terraform.tfstate"
  }
}