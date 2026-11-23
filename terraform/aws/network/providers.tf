
terraform {
  required_version = ">= 1.17.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.0"
    }
  }
}

provider "aws" {
  region  = var.aws_region
  profile = "lab"

  default_tags {
    tags = {
      Project     = "devops-task-manager"
      Environment = "lab"
      ManagedBy   = "Terraform"
    }
  }
}
