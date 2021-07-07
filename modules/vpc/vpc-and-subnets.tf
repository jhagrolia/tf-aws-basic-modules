// Creating VPC
resource "aws_vpc" "vpc1" {
  cidr_block = var.cidrs.vpc
  enable_dns_hostnames = var.enable_dns_hostnames

  tags = {
    Name = var.vpc_name
  }
}

// Fetch Names of availability zones
data "aws_availability_zones" "available" {
  state = "available"
}

// Randomly select availability zones
resource "random_shuffle" "az" {
  input        = data.aws_availability_zones.available.names
  result_count = 2
}

// Creating Public Subnet
resource "aws_subnet" "public_subnet" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.cidrs.public_sn
  map_public_ip_on_launch = true
  availability_zone = random_shuffle.az.result.0

  tags = {
    Name = "PublicSubnet"
  }
}

// Creating Private Subnet
resource "aws_subnet" "private_subnet" {
  vpc_id     = aws_vpc.vpc1.id
  cidr_block = var.cidrs.private_sn
  availability_zone = random_shuffle.az.result.1

  tags = {
    Name = "PrivateSubnet"
  }
}
