provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = {
    Name = "my-vpc"
  }
}

resource "aws_subnet" "subnet" {
  for_each = var.subnets

  vpc_id = aws_vpc.my_vpc.id
  cidr_block = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}

# resource "aws_subnet" "public-subnet-1" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.0.0/24"
#   availability_zone = "eu-west-2a"

#   tags = {
#     Name = "public-subnet-1"
#   }
# }

# resource "aws_subnet" "public-subnet-2" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.1.0/24"
#   availability_zone = "eu-west-2b"

#   tags = {
#     Name = "public-subnet-2"
#   }
# }

# resource "aws_subnet" "private-subnet-1" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.2.0/24"
#   availability_zone = "eu-west-2a"

#   tags = {
#     Name = "private-subnet-1"
#   }
# }

# resource "aws_subnet" "private-subnet-2" {
#   vpc_id            = aws_vpc.my_vpc.id
#   cidr_block        = "10.0.3.0/24"
#   availability_zone = "eu-west-2b"

#   tags = {
#     Name = "private-subnet-2"
#   }
# }