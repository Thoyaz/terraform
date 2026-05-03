resource "aws_instance" "testserver01" {
  ami                    = "ami-0220d79f3f480ecf5"
  instance_type          = "t3.micro"
  vpc_security_group_ids = [aws_security_group.testserver_sg.id]

  tags = {
    Name      = "Test Server"
    Terraform = true
  }
}

resource "aws_security_group" "testserver_sg" {

  name        = "testserver_sg"
  description = "Allow all traffic"

  # ... other configuration ...

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  tags = {
    Name      = "testserver01"
    terraform = true
  }

  lifecycle {
    create_before_destroy = true
  }
}