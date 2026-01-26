resource "aws_vpc" "this" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.vpc.tags
}

resource "aws_subnet" "public" {
  count                   = length(var.subnets_availability_zones)
  availability_zone       = var.subnets_availability_zones[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + 1)
  tags = {
    Name                     = "public-${aws_vpc.this.tags["Name"]}-${substr(var.subnets_availability_zones[count.index], -2, 2)}"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.subnets_availability_zones)
  availability_zone       = var.subnets_availability_zones[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + length(var.subnets_availability_zones) + 1)
  tags = {
    Name                              = "private-${aws_vpc.this.tags["Name"]}-${substr(var.subnets_availability_zones[count.index], -2, 2)}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}