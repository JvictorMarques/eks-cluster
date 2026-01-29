module "network" {
  source = "./modules/vpc"

  vpc_name                   = var.vpc_name
  vpc_cidr_block             = var.vpc_cidr_block
  subnets_availability_zones = var.subnets_availability_zones
}

module "eks_cluster" {
  source = "./modules/eks"

  eks_cluster_name = var.eks_cluster_name
  eks_version      = var.eks_version
  eks_subnet_ids = concat(
    module.network.public_subnets,
    module.network.private_subnets
  )
  principal_arns = var.principal_arns
}