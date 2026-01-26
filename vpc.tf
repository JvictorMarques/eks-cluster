resource "aws_vpc" "this" {
  cidr_block           = var.vpc.cidr_block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags                 = var.vpc.tags
}

resource "aws_subnet" "public" {
  count                   = length(var.subnets.availability_zone)
  availability_zone       = var.subnets.availability_zone[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + 1)
  tags = {
    Name                     = "public-${substr(var.subnets.availability_zone[count.index], -2, 2)}"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_subnet" "private" {
  count                   = length(var.subnets.availability_zone)
  availability_zone       = var.subnets.availability_zone[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + length(var.subnets.availability_zone) + 1)
  tags = {
    Name                              = "private-${substr(var.subnets.availability_zone[count.index], -2, 2)}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}