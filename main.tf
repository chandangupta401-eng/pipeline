module "RG" {
  source = "./moduel/pre/RG"
  rg     = var.rg
}

# module "network" {
#   source = "./moduel/pre/vnet"
#   vnet = {
#     name                = var.vnet.name
#     resource_group_name = module.RG.name
#     location            = module.RG.location
#     address_space       = var.vnet.address_space
#   }
# }

# module "subnet" {
#   source = "./moduel/pre/subnet"
#   subnet = {
#     name                 = var.subnet.name
#     resource_group_name  = module.RG.name
#     virtual_network_name = module.network.vnet
#     address_prefixes     = var.subnet.address_prefixes
#   }
# }

module "storage" {
  source = "./moduel/pre/Storage"
  storage = {
    name                     = var.storage.name
    resource_group_name      = module.RG.name
    location                 = module.RG.location
    account_tier             = var.storage.account_tier
    account_replication_type = var.storage.account_replication_type
  }
}

module "container" {
  source = "./moduel/pre/container"
  container = {
    name                  = var.container.name
    storage_account_name  = module.storage.name
    container_access_type = var.container.container_access_type
  }
}