resource "aws_subnet" "ebs_subnet" {
  vpc_id                  = var.vpc_id
  cidr_block              = var.subnet_cidr
  map_public_ip_on_launch = true


  tags = {
    name = var.name
  }
}
