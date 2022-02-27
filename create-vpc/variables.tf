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

variable "project_name" {
  description = "Project name"
  type        = string
  default     = "msk"
}

variable "environment" {
  description = "AWS Environment"
  type        = string
  default     = "dev"
}

variable "resource_tags" {
  description = "Tags to set for all resources"
  type        = map(string)
  default     = {}
}

variable "subnets" {
  description = "Subnet values"
  type = map(object({
    cidr_block        = string,
    availability_zone = string
  }))
  default = {
    public-subnet-1 = {
      cidr_block        = "10.0.0.0/24"
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

variable "scala_version" {
  description = "Scala version used by Kafka"
  type        = string
  default     = "2.13"
}

variable "kafka_version" {
  description = "Kafka version"
  type        = string
  default     = "2.6.1"
}

variable "kafka_binary" {
  description = "Kafka name after downloading"
  type        = string
}