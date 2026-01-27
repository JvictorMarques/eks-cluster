module "network" {
  source = "./modules/vpc"

  vpc = var.vpc

  subnets_availability_zones = var.subnets_availability_zones
}

module "eks_cluster" {
  source = "./modules/eks"

  eks = {
    name       = var.vpc.name
    version    = var.eks_version
    subnet_ids = module.network.private_subnets
  }
}