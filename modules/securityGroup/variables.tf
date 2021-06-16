variable "vpc_id" {
  type = string
  description = "give VPC id to security group"
}

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
    "description" = "For SSH"
    "from_port" = "22"
    "to_port" = "22"
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