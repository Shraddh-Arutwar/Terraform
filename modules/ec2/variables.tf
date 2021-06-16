variable "vpc_id" {
  description = "It has vpc id value"
  type = string
}

variable "public_subnet_id" {
  description = "It gives public subnet id where Nat Gateway has to attched"
  type = list(string)
}

variable "private_subnet_id" {
  description = "It gives private subnet id"
  type = list(string)
}

variable "SecurityGroupId" {
  description = "It has security Group id"
  type = string
}

# variable "private-instance" {
#   description = "define all variables for private instance"
#   type = object({
#     ec2_ami = string 
#     instance_type = string
#     availability_zone = string
#     key_name = string 
#     Name = string
#   })
#   # default = {
#   #   ec2_ami = "ami-042e8287309f5df03"
#   #   instance_type = "t2.micro"
#   #   availability_zone = "us-east-1"
#   #   key_name = "project1"  
#   #   Name = "my-private-instance"
#   # } 
# }

# variable "public-instance" {
#   description = "define all variables for public instance"
#   type = object({
#     ec2_ami = string 
#     instance_type = string
#     availability_zone = string
#     key_name = string 
#     Name = string
#   })
#   # default = {
#   #   ec2_ami = "ami-042e8287309f5df03"
#   #   instance_type = "t2.micro"
#   #   availability_zone = "us-east-1"
#   #   key_name = "project1"  
#   #   Name = "my-publicinstance"
#   # } 
# }

variable "private_ec2_ami" {
  description = "Please enter AMI id to spin ec2 instance"
  type = string
}

variable "public_ec2_ami" {
  description = "Please enter AMI id to spin ec2 instance"
  type = string 
}

variable "private_ec2_instancetype" {
  description = "Enter instance type you want to use"
  type = string 
}

variable "public_ec2_instancetype" {
  description = "Enter instance type you want to use"
  type = string 
}

variable "key_name" {
  description = "Enter pem key Name to be used"
  type = string 
}

variable "private_instance_name" {
  description = "Please provide private instance Name"
  type = string
}

variable "public_instance_name" {
  description = "Please provide public instance Name"
  type = string 
}

variable "availability_zones" {
  description = "Available zones"
}
