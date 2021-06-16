provider "aws" {
  access_key = var.aws_keys.access_key 
  secret_key = var.aws_keys.secret_key 
  region = var.aws_keys.region
}

module "vpc" {
    source = "./modules/vpc"
    vpc_cidr       = var.vpc_cidr
    vpc_name       = var.vpc_name
    public_subnet_cidr = var.public_subnet_cidr
    private_subnet_cidr = var.private_subnet_cidr
}   

# Security Group defination
module "SecurityGroup" {
  source = "./modules/securityGroup"
  vpc_id = module.vpc.vpc_id 
  sg_name = var.sg_name
  sg_description = var.sg_description
}

# IG and RT defination 
module "Networking" {
  source = "./modules/IGandRT"
  vpc_id = module.vpc.vpc_id 
  private_subnet_id = module.vpc.private_subnet_id 
  public_subnet_id = module.vpc.public_subnet_id 
  ig_name = var.ig_name
  nat_gateway_name = var.nat_gateway_name
  PublicRT_cidr_block = var.PublicRT_cidr_block 
  PublicRT_name = var.PublicRT_name
  PrivateRT_cidr_block = var.PrivateRT_cidr_block
  PrivateRT_name = var.PrivateRT_name 
}

# Public and private Instance 
module "instance" {
  source = "./modules/ec2"
  vpc_id = module.vpc.vpc_id 
  private_subnet_id = module.vpc.private_subnet_id[0]
  public_subnet_id = module.vpc.public_subnet_id[0]
  SecurityGroupId = module.SecurityGroup.SecurityGroupId  
  availability_zones = module.vpc.availability_zones 
  private_ec2_ami = var.private_ec2_ami
  public_ec2_ami = var.public_ec2_ami
  private_ec2_instancetype = var.private_ec2_instancetype
  public_ec2_instancetype = var.public_ec2_instancetype
  key_name = var.key_name
  private_instance_name = var.private_instance_name 
  public_instance_name = var.public_instance_name
}

# Load balancer 
module "lb" {
  source = "./modules/LoadBalancer" 
  vpc_id = module.vpc.vpc_id
  private_instance_id = module.instance.private_instance_id
  SecurityGroupId = module.SecurityGroup.SecurityGroupId   
  public_subnet_id = module.vpc.public_subnet_id[*] 
  lb_name = var.lb_name
  lb_internal = var.lb_internal
  lb_type = var.lb_type
  lb_iptype = var.lb_iptype
  lb_deletion_protection = var.lb_deletion_protection
  target_name = var.target_name
  tg_port = var.tg_port 
  tg_protocol = var.tg_protocol 
  target_attchment_port = var.target_attchment_port
  listner_port = var.listner_port 
  listner_protocol = var.listner_protocol 
  listner_type = var.listner_type 
}
