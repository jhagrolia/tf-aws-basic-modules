// Terraform S3 Backend for Remote State Management
terraform {
  backend "s3" {
    bucket = "bucket_name"
    key = "path/key_name.tfstate"
    region = "region_name"
    dynamodb_table = "table_name"
  }
}

// Importing VPC Module
module "vpc_module" {
  source = "./modules/vpc/"
  vpc_name = var.vpc_name
}
