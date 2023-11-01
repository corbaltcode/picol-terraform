variable "account_id" {
  type = string
  description = "The AWS account id being deployed to"
}

variable "environment" {
  type = string
  description = "The environment being deployed to"
}

variable "partition" {
  type = string
  description = "THe AWS partition being deployed to"
}

variable "project" {
  type = string
  description = "The name of the project"
}

variable "region" {
  type = string
  description = "The AWS region being deployed to"
}

variable "vpc_ipv4_cidr" {
  type = string
  default = "10.39.0.0/16"
  description = "The IPv4 CIDR block for the VPC"
}
