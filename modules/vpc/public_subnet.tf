resource "aws_subnet" "public_subnets" {
  count                   = length(var.public_subnets_cidr)
  availability_zone       = element(var.availability_zones, count.index)
  cidr_block              = element(var.public_subnets_cidr, count.index)
  map_public_ip_on_launch = true
  vpc_id                  = aws_vpc.main_vpc.id
  
  tags = {
    Name = "public_subnet_${count.index}"
  }
}

resource "aws_internet_gateway" "main_igw" {
  vpc_id = aws_vpc.main_vpc.id

  tags = {
    Name = "main_igw"
  }
}

resource "aws_route_table" "public_rt" {
  vpc_id = aws_vpc.main_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.main_igw.id
  }

  tags = {
    Name = "public_rt"
  }
}

resource "aws_route_table_association" "public_subnets_rta" {
  count          = 1
  subnet_id      = aws_subnet.public_subnets.*.id[count.index]
  route_table_id = aws_route_table.public_rt.id
}
