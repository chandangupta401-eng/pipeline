resource "azurerm_storage_account" "storage" {
  name = var.storage.name
  resource_group_name      = var.storage.resource_group_name
  location                 = var.storage.location
  account_tier             = var.storage.account_tier
  account_replication_type = var.storage.account_replication_type

  tags = {
    environment = "staging"
  }
}
  