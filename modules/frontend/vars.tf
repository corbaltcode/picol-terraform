variable "account_id" {
  type        = string
  description = "The AWS account id being deployed to"
}

variable "environment" {
  type        = string
  description = "The environment being deployed to"
}

variable "partition" {
  type        = string
  description = "THe AWS partition being deployed to"
}

variable "project" {
  type        = string
  description = "The name of the project"
}

variable "region" {
  type        = string
  description = "The AWS region being deployed to"
}

variable "log_retention_days" {
  type        = number
  description = "The number of days to retain logs for"
  default     = 30
}

variable "frontend_memory_mb" {
  type        = number
  description = "The amount of memory to allocate to the frontend Lambda function"
  default     = 512
}

variable "frontend_timeout_secs" {
  type        = number
  description = "The amount of time to allow the frontend Lambda function to run for"
  default     = 28
}
