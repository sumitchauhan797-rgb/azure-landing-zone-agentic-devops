module "resource_group" {
  source          = "../../modules/resource-group"
  resource_groups = var.resource_groups
}
module "virtual_network" {
  source = "../../modules/networking/VNet"
  vnets  = var.vnets
}
module "subnet" {
  depends_on = [module.resource_group, module.virtual_network]
  source     = "../../modules/networking/subnet"
  subnets    = var.subnets
}
module "network_security_group" {
  depends_on = [module.resource_group]
  source     = "../../modules/networking/NSG"
  NSGs       = var.NSGs
}