resource "aws_subnet" "public1" {
  vpc_id = aws_vpc.my_vpc.id

  cidr_block = "10.0.0.0/24"
  availability_zone = "ap-northeast-1a"
}