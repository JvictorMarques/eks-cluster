resource "aws_subnet" "public" {
  count                   = length(var.subnets_availability_zones)
  availability_zone       = var.subnets_availability_zones[count.index]
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.this.id
  cidr_block              = cidrsubnet(aws_vpc.this.cidr_block, 8, count.index + 1)
  tags = {
    Name                     = "public-${var.project_name}-${substr(var.subnets_availability_zones[count.index], -2, 2)}"
    "kubernetes.io/role/elb" = "1"
  }
}

resource "aws_internet_gateway" "this" {
  vpc_id = aws_vpc.this.id

  tags = {
    Name = "${var.project_name}-igw"
  }
}

resource "aws_route_table" "public" {
  vpc_id = aws_vpc.this.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.this.id
  }

  tags = {
    Name = "${var.project_name}-igw-rt"
  }
}

resource "aws_route_table_association" "public" {
  count          = length(var.subnets_availability_zones)
  subnet_id      = aws_subnet.public[count.index].id
  route_table_id = aws_route_table.public.id
}