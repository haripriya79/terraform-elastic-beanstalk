resource "aws_security_group" "security-group" {
  vpc_id = var.vpc_id

  egress {
    from_port = 0
    protocol  = "-1"
    to_port   = 0
    cidr_blocks = [
      "0.0.0.0/0"
    ]
  }
}

