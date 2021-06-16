output "private_instance_id" {
  description = "It has private instace id"
  value = aws_instance.terraform-private-instance.id
}