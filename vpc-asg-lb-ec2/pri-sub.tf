resource "aws_subnet" "private-a" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.11.0/24"
 }
