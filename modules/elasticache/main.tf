// Provider Requirements
terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "3.48.0"
    }
  }
}

// Getting VPC Data
data "aws_vpc" "default" {
  filter {
    name = "isDefault"
    values = ["true"]
  }
}

// Getting Subnets
data "aws_subnet_ids" "subnets" {
  vpc_id = var.vpc_id == null ? data.aws_vpc.default.id : var.vpc_id
}

// Creating Subnet Group
resource "aws_elasticache_subnet_group" "cache_subnet_group" {
  name       = "cache-subnet-group"
  subnet_ids = var.subnets == null ? data.aws_subnet_ids.subnets.ids : var.subnets
}

// Launching AWS Elasticache Cluster
resource "aws_elasticache_cluster" "cache_cluster" {
  cluster_id           = var.cluster_name
  engine               = var.engine.name
  engine_version       = var.engine.version
  node_type            = var.node_type
  num_cache_nodes      = var.num_cache_nodes
  parameter_group_name = var.parameter_group
  port                 = var.port
  subnet_group_name = aws_elasticache_subnet_group.cache_subnet_group.name
}
