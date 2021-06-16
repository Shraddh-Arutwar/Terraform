provider "aws" {
  region = "us-east-1"
  access_key = "<acess_key>"
  secret_key = "<secret_key>"
}

# 7. Load Balnencer 
resource "aws_lb" "terraform-load-balncer" {
  name               = var.lb_name
  internal           = var.lb_internal
  load_balancer_type = var.lb_type
  security_groups    = var.SecurityGroupId 
  subnets            = [var.public_subnet_id] 
  ip_address_type    = var.lb_iptype 
  enable_deletion_protection = var.lb_deletion_protection 
  tags = {
    Name = var.lb_name
  }
}

resource "aws_lb_target_group" "terraform-target-group" {
  name     = var.target_name
  port     = var.tg_port
  protocol = var.tg_protocol
  vpc_id   = var.vpc_id
}

resource "aws_lb_target_group_attachment" "terraform-target-attchment" {
  target_group_arn = aws_lb_target_group.terraform-target-group.arn
  target_id        = var.private_instance_id
  port             = var.target_attchment_port
}

resource "aws_lb_listener" "terraform-front_end" {
  load_balancer_arn = aws_lb.terraform-load-balncer.arn
  port              = var.listner_port 
  protocol          = var.listner_protocol 
  default_action {
    type             = var.listner_type 
    target_group_arn = aws_lb_target_group.terraform-target-group.arn
  }
}