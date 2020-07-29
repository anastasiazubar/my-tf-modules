resource "aws_vpc" "demo" {
  cidr_block = var.cidr_block
tags = {
Name = "AnastasiazVPC"
}
}
