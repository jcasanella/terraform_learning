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