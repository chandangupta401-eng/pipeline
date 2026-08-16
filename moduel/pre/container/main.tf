resource "azurerm_storage_container" "container" {
  name                  = var.container.name
  storage_account_name  = var.container.storage_account_name
  container_access_type = var.container.container_access_type
}
