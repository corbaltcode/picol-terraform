variable "billing_mode" {
  type = string
  default = "PAY_PER_REQUEST"
  description = "The billing mode for DynamoDB tables; either PAY_PER_REQUEST or PROVISIONED"

  validation {
    condition = var.billing_mode == "PAY_PER_REQUEST" || var.billing_mode == "PROVISIONED"
    error_message = "billing_mode must be PAY_PER_REQUEST or PROVISIONED"
  }
}

variable "environment" {
  type = string
  description = "The environment being deployed to"
}

variable "private_subnet_ids" {
  type = list(string)
  description = "The private subnet IDs for the VPC"
}

variable "project" {
  type = string
  description = "The name of the project"
}

variable "read_capacity" {
  type = number
  default = null
  description = "If billing_mode is PROVISIONED, the read capacity for DynamoDB tables"
}

variable "table_prefix" {
  type = string
  default = ""
  description = "The string to prefix to each table name"
}

variable "write_capacity" {
  type = number
  default = null
  description = "If billing_mode is PROVISIONED, the write capacity for DynamoDB tables"
}
