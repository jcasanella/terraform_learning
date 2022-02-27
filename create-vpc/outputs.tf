output "vpc-id" {
  value = aws_vpc.my_vpc.id
}

output "vpc-cidr" {
  value = aws_vpc.my_vpc.cidr_block
}

output "vpc-tags" {
  value = aws_vpc.my_vpc.tags
}

output "subnet-id" {
  value = [for u in aws_subnet.subnet : u.id]
}

output "subnet-az" {
  value = [for u in aws_subnet.subnet : u.availability_zone]
}

output "subnet-cidr" {
  value = [for u in aws_subnet.subnet : u.cidr_block]
}