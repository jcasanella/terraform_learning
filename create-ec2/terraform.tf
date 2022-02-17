terraform {
  backend "s3" {
    # Replace this with your bucket name!
    bucket = "terraform-state-jordi-20200214"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    # Replace this with your DynamoDB table name!
    dynamodb_table = "terraform-up-and-running-locks"
    encrypt        = true
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 3.27"
    }

    random = {
      source = "hashicorp/random"
    }
  }
}