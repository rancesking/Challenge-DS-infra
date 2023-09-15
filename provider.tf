terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.17.0"
    }
  }
}

#Set AWS provider region
provider "aws" {
  region = var.region
  default_tags {
    tags = {
      Environment = var.env
      Service       = "VM"
      CLI_User = var.cli_user
    }
  }
}
