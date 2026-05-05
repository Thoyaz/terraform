resource "aws_instance" "testserver01" {
  ami                    = var.ami_id
  instance_type          = var.instance_type
  vpc_security_group_ids = [aws_security_group.testserver_sg.id]

  tags = var.instance_tags
}

resource "aws_security_group" "testserver_sg" {

  name        = "testserver_sg"
  description = "Allow all traffic"

  # ... other configuration ...

  egress {
    from_port        = var.sg_egress_from_port
    to_port          = var.sg_egress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_egress_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = var.sg_ingress_from_port
    to_port          = var.sg_ingress_to_port
    protocol         = "-1"
    cidr_blocks      = var.sg_ingress_cidr
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = var.sg_tags

  lifecycle {
    create_before_destroy = true
  }
}