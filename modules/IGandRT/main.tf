# Configure the AWS Provider+
provider "aws" {
  region = "us-east-1"
  access_key = "<access_key>"
  secret_key = "<secret_key>"
}

# 4. Create Internet Gateway 
resource "aws_internet_gateway" "terraform-internet-gateway" {
  vpc_id = var.vpc_id 
  tags = {
    Name = var.ig_name
  }
}

resource "aws_eip" "nat" {
  vpc                       = true
}

resource "aws_nat_gateway" "terraform-nat-gateway" {
  allocation_id = aws_eip.nat.id 
  subnet_id     = flatten(var.public_subnet_id) [0] 
  tags = {
    Name = var.nat_gateway_name
  }
}

# 5. Create Route Table and associate to subnet 
resource "aws_route_table" "terraform-public-route-table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.PublicRT_cidr_block
    gateway_id = aws_internet_gateway.terraform-internet-gateway.id 
  }
  tags = {
    Name = var.PublicRT_name
  }
}

resource "aws_route_table" "terraform-private-route-table" {
  vpc_id = var.vpc_id
  route {
    cidr_block = var.PrivateRT_cidr_block 
    gateway_id = aws_nat_gateway.terraform-nat-gateway.id 
  }
  tags = {
    Name = var.PrivateRT_name
  }
}

resource "aws_route_table_association" "terraform-public01" {
  count = length(var.public_subnet_id)
  subnet_id      = var.public_subnet_id[count.index]
  route_table_id = aws_route_table.terraform-public-route-table.id
}

resource "aws_route_table_association" "terraform-private01" {
  count = length(var.private_subnet_id)  
  subnet_id      = var.private_subnet_id[count.index]
  route_table_id = aws_route_table.terraform-private-route-table.id
}