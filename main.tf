variable "rg" {}
variable "storage" {}
module "RG" {
  source = "./moduel/pre/RG"
  rg     = var.rg
}
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
