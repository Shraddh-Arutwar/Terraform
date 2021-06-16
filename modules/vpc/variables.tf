variable "vpc_cidr" {
  description = "VPC cider"
  type = string 
}

variable "vpc_name" {
  description = "vpc name"
  type = string
  default = "test_vpc"
}

variable "public_subnet_cidr" {
  description = "We are going to create public subnets in VPC"
  type = list(string)
}

variable "private_subnet_cidr" {
    description = "We are going to create privete subent in VPC"
    type = list(string)
}