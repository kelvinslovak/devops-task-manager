terraform {
  required_version = ">= 1.17.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }

  backend "s3" {
    bucket       = "devops-task-manager-tfstate-8c08f8badb14f7eee705c74437"
    key          = "ecr/terraform.tfstate"
    region       = "us-east-1"
    profile      = "lab"
    encrypt      = true
    use_lockfile = true
  }
}

provider "aws" {
  region  = "us-east-1"
  profile = "lab"

  default_tags {
    tags = {
      Project     = "devops-task-manager"
      Environment = "lab"
      ManagedBy   = "Terraform"
    }
  }
}
