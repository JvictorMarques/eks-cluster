aws_region                 = "us-east-1"
vpc_name                   = "eks-cluster"
vpc_cidr_block             = "10.0.0.0/16"
subnets_availability_zones = ["us-east-1a", "us-east-1b"]
eks_version                = "1.35"
default_tags = {
  Project   = "eks-cluster"
  ManagedBy = "Terraform"
}