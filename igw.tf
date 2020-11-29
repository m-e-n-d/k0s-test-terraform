resource "aws_route_table" "public_route" {
  vpc_id = aws_vpc.my_vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.k8s_gateway.id
  }
}

resource "aws_route_table_association" "public1" {
  subnet_id = aws_subnet.public1.id
  route_table_id = aws_route_table.public_route.id
}

resource "aws_internet_gateway" "k8s_gateway" {
  vpc_id = aws_vpc.my_vpc.id
}