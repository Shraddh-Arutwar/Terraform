output "SecurityGroupId" {
  description = "It has Security group ID"
  value = aws_security_group.terraform-security-group.id 
}