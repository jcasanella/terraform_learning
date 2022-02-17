variable "bucket_name" {
  description = "Value of the bucket name for the S3"
  type        = string
  default     = "terraform-state-jordi-20200214"
}

variable "dynamo_name" {
  description = "Value of the dynamo table name for the S3"
  type        = string
  default     = "terraform-up-and-running-locks"
}