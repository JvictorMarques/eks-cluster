resource "aws_subnet" "private" {
  count                   = length(var.subnets_availability_zones)
  availability_zone       = var.subnets_availability_zones[count.index]
  map_public_ip_on_launch = false
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + length(var.subnets_availability_zones) + 1)
  tags = {
    Name                              = "private-${var.project_name}-${substr(var.subnets_availability_zones[count.index], -2, 2)}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}

resource "aws_nat_gateway" "this" {
  vpc_id            = aws_vpc.this.id
  availability_mode = "regional"

  depends_on = [
    aws_internet_gateway.this
  ]
  tags = {
    Name = "${var.project_name}-ngw"
  }
}

resource "aws_route_table" "private" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.this.id
  }

  tags = {
    Name = "${var.project_name}-nat-gw-rt"
  }
}

resource "aws_route_table_association" "private" {
  count          = length(var.subnets_availability_zones)
  subnet_id      = aws_subnet.private[count.index].id
  route_table_id = aws_route_table.private.id
}