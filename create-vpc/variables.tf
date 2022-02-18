variable "aws_region" {
  description = "AWS Region"
  type        = string
  default     = "eu-west-2"
}

variable "aws_profile" {
  description = "AWS profile"
  type        = string
  default     = "default"
}

variable "subnets" {
    description = "Subnet values"
    type = map(object({
        cidr_block = string,
        availability_zone = string
    }))
    default = {
        public-subnet-1 = {
            cidr_block = "10.0.0.0/24"     
            availability_zone = "eu-west-2a"     
        },
        public-subnet-2 = {
            cidr_block        = "10.0.1.0/24"
            availability_zone = "eu-west-2b"            
        },
        private-subnet-1 = {
            cidr_block        = "10.0.2.0/24"
            availability_zone = "eu-west-2a"            
        },
        private-subnet-2 = {
            cidr_block        = "10.0.3.0/24"
            availability_zone = "eu-west-2b"            
        }
    }
}