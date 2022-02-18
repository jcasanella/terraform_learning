terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket         = "terraform-state-jordi-20200214"
    key            = "terraform.tfstate"
    region         = "eu-west-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }
  }

  required_version = ">= 0.14.9"
}

provider "aws" {
  profile = "default"
  region  = "eu-west-2"
}

resource "aws_instance" "app_server" {
  ami           = "ami-098a393b6fa6e700b"
  instance_type = "t2.micro"

  tags = {
    Name = var.instance_name
  }
}
