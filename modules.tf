module "eks_network" {
  source = "./modules/vpc"

  vpc = var.vpc

  subnets_availability_zones = var.subnets_availability_zones
}