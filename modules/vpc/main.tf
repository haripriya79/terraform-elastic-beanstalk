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