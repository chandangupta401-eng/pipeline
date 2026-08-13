
rg = {
  name     = "RG"
  location = "centralindia"
}
storage = {
  name                     = "storagetest10aug26"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
vnet = {
  name = "vnet1"
  address_space = ["10.10.0.0/16"]
}
subnet = {
  name = "subnet1"
  address_prefixes = ["10.10.10.0/24"]
}
