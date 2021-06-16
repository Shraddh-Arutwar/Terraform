# Configure the AWS Provider+
provider "aws" {
  region = "us-east-1"
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

# 6. AWS instance in Private subnet and public subnet 
resource "aws_instance" "terraform-private-instance" {
  ami           = var.private_ec2_ami 
  instance_type = var.private_ec2_instancetype  
  availability_zone =  var.availability_zones 
  key_name = var.key_name 
  vpc_id = var.vpc_id
  subnet_id = var.private_subnet_id[0]  
  security_groups = [var.SecurityGroupId] 
  user_data = <<-EOF
              #!/bin/bash 
              sudo apt update -y 
              sudo apt install apache2 -y 
              sudo systemctl start apache2 
              sudo bash -c 'echo HelloWorld > /var/www/html/index.html'
              EOF       
  tags = {
    Name = var.private_instance_name
  }
}

resource "aws_instance" "terraform-public-instance" {
  ami           = var.public_ec2_ami 
  instance_type = var.public_ec2_instancetype
  availability_zone = var.availability_zones 
  key_name = var.key_name 
  vpc_id = var.vpc_id
  subnet_id = var.public_subnet_id[0] 
  security_groups = [var.SecurityGroupId]           
  tags = {
    Name = var.public_instance_name
  }
}