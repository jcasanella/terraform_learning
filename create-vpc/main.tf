provider "aws" {
  profile = var.aws_profile
  region  = var.aws_region
}

locals {
  required_tags = {
    project     = var.project_name,
    environment = var.environment
  }

  tags = merge(var.resource_tags, local.required_tags)
}

resource "aws_vpc" "my_vpc" {
  cidr_block       = "10.0.0.0/16"
  instance_tenancy = "default"

  tags = local.tags
}

resource "aws_subnet" "subnet" {
  for_each = var.subnets

  vpc_id            = aws_vpc.my_vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone

  tags = {
    Name = each.key
  }
}

data "aws_ami" "amazon_linux" {
  most_recent = true

  filter {
    name   = "name"
    values = ["amzn2-ami-kernel-5.10-hvm*"]
  }
  owners = ["amazon"] # Canonical
}

data "aws_subnets" "selected" {
  filter {
    name   = "vpc-id"
    values = [aws_vpc.my_vpc.id]
  }
  # filter {
  #   name   = "tag:Name"
  #   values = ["public-subnet-1"]
  # }
}

output "subnet_cidr_blocks" {
  value = data.aws_subnets.selected
}

resource "aws_instance" "kafka" {
  ami           = data.aws_ami.amazon_linux.id
  instance_type = "t2.micro"
  subnet_id     = aws_subnet.subnet["public-subnet-1"].id

  provisioner "local-exec" {
    command = "wget -O ${var.kafka_binary} https://archive.apache.org/dist/kafka/${var.scala_version}/kafka_${var.scala_version}-${var.kafka_version}.tgz"
  }

  provisioner "file" {
    source      = "scripts/start.sh"
    destination = "/tmp/provider/script.sh"
  }

  provisioner "file" {
    source      = var.kafka_binary
    destination = "/tmp/provider/kafka.tgz"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/provider/script.sh",
      "/tmp/script.sh"
    ]
  }

  tags = {
    Name = "Kafka Machine"
  }
}