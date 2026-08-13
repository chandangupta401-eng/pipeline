output "subnet" {
  value = azurerm_subnet.subnet.name
}
output "address_prefixes" {
  value = azurerm_subnet.subnet.address_prefixes
}
