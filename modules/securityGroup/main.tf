# Configure the AWS Provider+
provider "aws" {
  region = "us-east-1"
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

# 3. Create Security Group 
resource "aws_security_group" "terraform-security-group" {
  name        = var.sg_name 
  description = var.sg_description
  vpc_id      = var.vpc_id

  # ingress {
  #   description      = var.security_ingress.description 
  #   from_port        = var.security_ingress.from_port 
  #   to_port          = var.security_ingress.to_port 
  #   protocol         = var.security_ingress.protocol
  #   cidr_blocks      = var.security_ingress.cidr_blocks 
  # }
  
  ingress {
    description      = "Port for HTTP"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    description      = "Port for SSH"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
  tags = {
    Name = var.sg_name
  }
}