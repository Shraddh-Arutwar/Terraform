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

variable "ig_name" {
  description = "It has Internet Gateway Name"
  type = string
}

variable "nat_gateway_name" {
  description = "Set Nat Gateway Name"
  type = string 
}

variable "PublicRT_cidr_block" {
  description = "It assigne cidr-block to public route Table"
  type = string
}

variable "PublicRT_name" {
  description = "It gives Name to public route Table"
  type = string 
}

variable "PrivateRT_cidr_block" {
  description = "It assigne cidr-block to public route Table"
  type = string 
}

variable "PrivateRT_name" {
  description = "It gives Name to public route Table"
  type = string 
}

# variable "associate_private_ip" {
#     description = "It create eip in vpc"
#     type = string 
# }



