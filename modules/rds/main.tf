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
resource "aws_db_subnet_group" "db_subnet_group" {
  name       = "rds-subnet-group"
  subnet_ids = var.subnets == null ? data.aws_subnet_ids.subnets.ids : var.subnets
}

// Creating Security Group For RDS
resource "aws_security_group" "rds_sg" {
  name        = "rds-sg"
  description = "SG for RDS"
  vpc_id      = var.vpc_id == null ? data.aws_vpc.default.id : var.vpc_id

  ingress {
    description = "RDS Rule"
    from_port   = var.rds_port
    to_port     = var.rds_port
    protocol    = "tcp"
    cidr_blocks = var.rds_allow_cidr
  }
}

// Launching AWS Database Instance i.e. RDS
resource "aws_db_instance" "rds_db" {
  engine            = var.engine.name
  engine_version    = var.engine.version
  identifier        = var.db_identifier
  username          = var.db_cred.user
  password          = var.db_cred.pass
  name = var.db_name
  
  instance_class    = var.db_inst_class
  storage_type      = var.db_storage.class
  allocated_storage = var.db_storage.size

  db_subnet_group_name = aws_db_subnet_group.db_subnet_group.name
  publicly_accessible = var.public_rds
  vpc_security_group_ids = [aws_security_group.rds_sg.id]
  port = var.rds_port

  auto_minor_version_upgrade = var.upgrade.auto_minor
  allow_major_version_upgrade = var.upgrade.allow_major

  deletion_protection = var.rds_del_protection

  skip_final_snapshot = var.final_snapshot.skip
  final_snapshot_identifier = var.final_snapshot.identifier
}
