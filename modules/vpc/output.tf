output "vpc_id" {
  description = "will have vpc details"
  value = aws_vpc.terraform_vpc.id 
  }

# output "terraform_vpc" {
#   description = "data regarding vpc"
#   value = aws_vpc.terraform_vpc
# }

output "public_subnet_id" {
  description = "will have subnet id"
  value = aws_subnet.public-subnets.*.id
}

output "private_subnet_id" {
  description = "will have subnet id"
  value = aws_subnet.private-subnets.*.id
}

output "availability_zones" {
  description = "will give all availability_zones"
  value = data.aws_availability_zones.azs  
}