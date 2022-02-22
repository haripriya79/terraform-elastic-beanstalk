resource "aws_vpc" "ebs-vpc" {
  cidr_block       = var.cidr_block
  instance_tenancy = var.tenancy
  tags = {
    name = var.name
  }
}
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.ebs-vpc.id   

  tags = {
    Name = var.name
  }
}
resource "aws_default_route_table" "route_table" {
  default_route_table_id = aws_vpc.ebs-vpc.default_route_table_id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }

  
  tags = {
    Name = "ebs-vpc-route"
  }
}