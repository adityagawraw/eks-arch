resource "aws_security_group" "eks_node_group_sg"{
  vpc_id = aws_vpc.main.id

  ingress{
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress{
    from_port = 0
    to_port   = 0
    protocol  = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "eks_node_group_sg"
  }
}
