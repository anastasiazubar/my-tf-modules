resource "aws_nat_gateway" "main" {
    subnet_id         = aws_subnet.public-a.id
    allocation_id     = aws_eip.nat-gateway.id
}
