variable "lb_name" {
    description = "Load Balncer Name"
    type = string
}

variable "lb_internal" {
  description = "Please enter you want internet facing lb or not"
  type = bool
}

variable "lb_type" {
  description = "type of load balncer"
  type = string 
  default = "application" 
}

variable "SecurityGroupId" {
  description = "It has security Group id"
  type = string
} 

variable "public_subnet_id" {
  description = "It gives public subnet id where Nat Gateway has to attched"
  type = list(string)
}

variable "lb_iptype" {
  description = "Enter load balancer ip type"
  type = string
}

variable "lb_deletion_protection" {
    description = "Enter deletion protection to be enabled or disabled"
    type = bool
}

variable "target_name" {
  description = "Enter target group name"
  type = string 
}

variable "tg_port" {
  description = "Enter tg port to enable"
  type = number
}

variable "tg_protocol" {
  description = "Enter tg protocol"
  type = string
}

variable "private_instance_id" {
    description = "Private instance id"
    type = string
}

variable "target_attchment_port" {
  description = "Enter Target attchment port"
  type = number 
}

variable "listner_port" {
  description = "Enter listner port"
  type = number
}

variable "listner_protocol" {
  description = "Enter listner protocol"
  type = string 
}

variable "listner_type" {
  description = "Enter listner type"
  type = string 
}

variable "vpc_id" {
  description = "It has VPC id"
  type = string 
}

