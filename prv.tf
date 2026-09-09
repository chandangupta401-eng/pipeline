terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 5"
    }
  }
}
provider "azurerm" {
  # Configuration options
  features {}
}