// Provider Requirements
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.48.0"
    }
  }
}

// AWS Provider Configuration
provider "aws" {
  profile = "default"
  region  = "region_name"
}
