# Provider Block
provider "aws" {
  region  = var.aws_region
  #profile = var.aws_cuenta
  default_tags {
    tags = {
      Name        = var.name-project
      Environment = var.environment
      Workload    = var.workload
      Owner       = var.owner
      Entity      = var.entity
      Backup      = var.backup
      Tier        = var.tier
    }
  }
}

terraform {
  required_version = "> 0.14" # which means any version equal & above 0.14 like 0.15, 0.16 etc and < 1.xx
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 4.6.0"
    }
  }
  backend "s3" {
    bucket = "operaciones-terraform-prex-playground-us-east-1"
    key    = "testing-gitactions-lambda/workspaces/terraform.tfstate"
    region = "us-east-1"
    # For State Locking
    dynamodb_table = "terraform-remote-state"
  }
}

