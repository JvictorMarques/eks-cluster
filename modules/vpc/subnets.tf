resource "aws_subnet" "public" {
  count                   = length(local.tolist_subnets_availability_zones)
  availability_zone       = local.tolist_subnets_availability_zones[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + 1)
  tags = {
    Name                                            = "public-${var.vpc_name}-${substr(local.tolist_subnets_availability_zones[count.index], -2, 2)}"
    "kubernetes.io/role/elb"                        = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}

resource "aws_subnet" "private" {
  count                   = length(local.tolist_subnets_availability_zones)
  availability_zone       = local.tolist_subnets_availability_zones[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + length(local.tolist_subnets_availability_zones) + 1)
  tags = {
    Name                                            = "private-${var.vpc_name}-${substr(local.tolist_subnets_availability_zones[count.index], -2, 2)}"
    "kubernetes.io/role/internal-elb"               = "1"
    "kubernetes.io/cluster/${var.eks_cluster_name}" = "shared"
  }
}