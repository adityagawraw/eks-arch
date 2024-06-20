resource "aws_eip" "nat" {
  tags = var.aws_eip_tags
}

resource "aws_nat_gateway" "nat" {
  allocation_id = aws_eip.nat.id
  subnet_id     = aws_subnet.public-us-east-1a.id

  tags = var.aws_vpc_nat_tags

  depends_on = [aws_internet_gateway.igw]
}