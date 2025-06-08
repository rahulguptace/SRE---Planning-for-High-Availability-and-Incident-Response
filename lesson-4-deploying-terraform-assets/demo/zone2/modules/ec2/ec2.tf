resource "aws_instance" "aws_linux" {
  ami           = var.aws_ami
  count         = var.instance_count
  instance_type = "t3.micro"
  subnet_id     = var.public_subnet_ids[0]
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  tags = {
    Name = "Ubuntu-Web"
  }
}

resource "aws_security_group" "ec2_sg" {
  name        = "ec2_sg"
  vpc_id      = var.vpc_id

 tags = {
    Name = "ec2_sg"
  }
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_1" {
security_group_id = aws_security_group.ec2_sg.id
cidr_ipv4         = var.cidr_block
from_port         = 80
ip_protocol       = "tcp"
to_port           = 80
}

resource "aws_vpc_security_group_ingress_rule" "allow_tls_ipv4_2" {
security_group_id = aws_security_group.ec2_sg.id
cidr_ipv4         = var.cidr_block
from_port         = 22
ip_protocol       = "tcp"
to_port           = 22
}