provider "aws" {
  region = "us-east-1"
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

# 1. Create VPC
resource "aws_vpc" "terraform_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
    }
}

data "aws_availability_zones" "azs" {
	state = "available"
}

# 2. Create Subnets - 2 Public
resource "aws_subnet" "public-subnets" {
  count = length(var.public_subnet_cidr)  
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.public_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "my-public-subnet0${count.index+1}"
  }
}

# 2.1. Create Subnets - 2 Private subneta
resource "aws_subnet" "private-subnets" {
  count = length(var.private_subnet_cidr)  
  vpc_id     = aws_vpc.terraform_vpc.id
  cidr_block = var.private_subnet_cidr[count.index]
  availability_zone = data.aws_availability_zones.azs.names[count.index+2]
  tags = {
    Name = "my-private-subnet0${count.index+3}"
  }
}
