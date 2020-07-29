resource "aws_eip" "nat-gateway" {
    vpc = true
  }
