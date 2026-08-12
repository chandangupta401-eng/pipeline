variable "rg" {}
variable "storage" {}
variable "vnet" {}
module "RG" {
  source = "./moduel/pre/RG"
  rg     = var.rg
}

module "network" {
  source = "./moduel/pre/vnet"
  vnet = {
    name                = var.vnet.name
    resource_group_name = module.RG.name
    location            = module.RG.location
  }
}
