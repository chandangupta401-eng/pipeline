output "vnet" {
  value = azurerm_virtual_network.vnet.name
}
output "address_space" {
  value = azurerm_virtual_network.vnet.address_space
}
