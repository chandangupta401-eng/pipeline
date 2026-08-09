

resource "azurerm_resource_group" "FRI1" {
  name     = "day5"
  location = "Central India"
}



resource "azurerm_storage_account" "FRI2" {
  depends_on               = [azurerm_resource_group.FRI1]
  name                     = "iinspirabb8787jj"
  resource_group_name      = "day5"
  location                 = "Central India"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}

resource "azurerm_storage_container" "con1" {
  depends_on = [azurerm_storage_account.FRI2]
  name       = "ds256"

  storage_account_id    = azurerm_storage_account.FRI2.id
  container_access_type = "blob"
}
