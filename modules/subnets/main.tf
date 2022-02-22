resource "aws_subnet" "ebs_subnet_1" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_1
  map_public_ip_on_launch = true
  tags = {
    name = var.name
  }
}
resource "aws_subnet" "ebs_subnet_2" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr_2
  map_public_ip_on_launch = true
  tags = {
    name = var.name
  }
}
