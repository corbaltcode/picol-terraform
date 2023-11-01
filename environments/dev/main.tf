terraform {
  required_version = ">= 1.6"
  backend "s3" {
    bucket              = "ionosphere-terraform-state"
    key                 = "picol-dev.tfstate"
    region              = "us-west-2"
    dynamodb_table      = "TerraformLock"
    allowed_account_ids = ["966028770618"]
  }

  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "~> 5.21"
    }
  }
}

provider "aws" {
  default_tags {
    tags = {
      Project = local.project
      Environment = local.environment
    }
  }
}
