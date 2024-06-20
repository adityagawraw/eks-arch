locals{
  setup_name = "dev"
}

resource "aws_route_table" "private_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${local.setup_name}_cluster_private_route_table"
  }
}

resource "aws_route" "private_nat_route"{
  route_table_id = aws_route_table.private_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_nat_gateway.nat.id
}

resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${local.setup_name}_cluster_public_route_table"
  }
}

resource "aws_route" "public_ig_route"{
  route_table_id = aws_route_table.public_route_table.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id = aws_internet_gateway.igw.id
}

resource "aws_route_table_association" "private-us-east-1a" {
subnet_id = aws_subnet.private-us-east-1a.id
route_table_id  = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "private-us-east-1b" {
subnet_id = aws_subnet.private-us-east-1b.id
route_table_id  = aws_route_table.private_route_table.id
}

resource "aws_route_table_association" "public-us-east-1a" {
subnet_id = aws_subnet.public-us-east-1a.id
route_table_id  = aws_route_table.public_route_table.id
}

resource "aws_route_table_association" "public-us-east-1b" {
subnet_id = aws_subnet.public-us-east-1b.id
route_table_id  = aws_route_table.public_route_table.id
}