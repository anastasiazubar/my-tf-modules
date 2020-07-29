resource "aws_subnet" "public-a" {
  vpc_id     = aws_vpc.demo.id
  cidr_block = "10.0.1.0/24"
 }
