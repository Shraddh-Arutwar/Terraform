variable "aws_keys" {
  description = "It provides Access key and Secreat Access key"
  type = object({
    access_key = string
    secret_key = string
    region = string
  })
}

variable "vpc_cidr" {
  description = "vpc cidr_bock"
  type = string
  default = "10.0.0.0/26"
}

variable "vpc_name" {
  description = "vpc name"
  type = string
  default = "my_vpc"
}

variable "public_subnet_cidr" {
  description = "We are going to create public subnets in VPC"
  type = list(string)
  default = ["10.0.0.0/28", "10.0.0.16/28"]
}

variable "private_subnet_cidr" {
    description = "We are going to create privete subent in VPC"
    type = list(string)
    default = ["10.0.0.32/28", "10.0.0.48/28"]
}

# Security Group Variable defination 
variable "sg_name" {
  type = string
  description = "It contains sg name"
  default = "my-sg"
}

variable "sg_description" {
  type = string 
  default = "It is terraform Security Group"
}

variable "security_ingress" {
    type = list(map(string))
    description = "Gives list of cidr_blocks, description, from_port, ipv6_cidr_blocks, protocol, to_port"
      default = [
  {
    "description" = "For HTTP"
    "from_port" = "80"
    "to_port" = "80"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },
  {
    "description" = "For SSH"
    "from_port" = "22"
    "to_port" = "22"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },
  {
    "description" = "For HTTPS"
    "from_port" = "443"
    "to_port" = "443"
    "protocol" = "tcp"
    "cidr_blocks" = "0.0.0.0/0"
  },  
  ]
}

# IG and RT variables 
variable "ig_name" {
  description = "It has Internet Gateway Name"
  type = string
  default = "my_ig"
}

variable "nat_gateway_name" {
  description = "Set Nat Gateway Name"
  type = string 
  default = "my-Nat-gateway"
}

variable "PublicRT_cidr_block" {
  description = "It assigne cidr-block to public route Table"
  type = string
  default = "0.0.0.0/0"
}

variable "PublicRT_name" {
  description = "It gives Name to public route Table"
  type = string 
  default = "my-public-RT"
}

variable "PrivateRT_cidr_block" {
  description = "It assigne cidr-block to public route Table"
  type = string 
  default = "0.0.0.0/0"
}

variable "PrivateRT_name" {
  description = "It gives Name to public route Table"
  type = string 
  default = "my-private-RT" 
} 

# Define variables for Public and Private Instance 
variable "private_ec2_ami" {
  description = "Please enter AMI id to spin ec2 instance"
  type = string
  default = "ami-042e8287309f5df03" 
}

variable "public_ec2_ami" {
  description = "Please enter AMI id to spin ec2 instance"
  type = string
  default = "ami-042e8287309f5df03" 
}

variable "private_ec2_instancetype" {
  description = "Enter instance type you want to use"
  type = string 
  default = "t2.micro" 
}

variable "public_ec2_instancetype" {
  description = "Enter instance type you want to use"
  type = string 
  default = "t2.micro" 
}

variable "key_name" {
  description = "Enter pem key Name to be used"
  type = string 
  default = "project1" 
}

variable "private_instance_name" {
  description = "Please provide private instance Name"
  type = string
  default = "my-private-instance"  
}

variable "public_instance_name" {
  description = "Please provide public instance Name"
  type = string
  default = "my-public-instance"  
}

# Load Balancer Variables 
variable "lb_name" {
    description = "Load Balncer Name"
    type = string
    default = "my-load-balncer"
}

variable "lb_internal" {
  description = "Please enter you want internet facing lb or not"
  type = bool
  default = false
}

variable "lb_type" {
  description = "type of load balncer"
  type = string 
  default = "application" 
}

variable "lb_iptype" {
  description = "Enter load balancer ip type"
  type = string
  default = "ipv4" 
}

variable "lb_deletion_protection" {
    description = "Enter deletion protection to be enabled or disabled"
    type = bool
    default = false
}

variable "target_name" {
  description = "Enter target group name"
  type = string 
  default = "my-target-group"
}

variable "tg_port" {
  description = "Enter tg port to enable"
  type = number
  default = 80
}

variable "tg_protocol" {
  description = "Enter tg protocol"
  type = string
  default = "HTTP"
}

variable "target_attchment_port" {
  description = "Enter Target attchment port"
  type = number 
  default = 80
}

variable "listner_port" {
  description = "Enter listner port"
  type = number
  default = 80
}

variable "listner_protocol" {
  description = "Enter listner protocol"
  type = string 
  default = "HTTP"
}

variable "listner_type" {
  description = "Enter listner type"
  type = string 
  default = "forward"
}
