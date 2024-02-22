#Creation of the VPC
resource "aws_vpc" "app-vpc" {
  cidr_block           = var.cidr_block
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
  tags = {
    Name = "${var.env_prefix}-vpc"
  }
}

#Creation of the subent
resource "aws_subnet" "app-subnet" {
  count                   = length(var.subnet_cidr_blocks)
  vpc_id                  = aws_vpc.app-vpc.id
  cidr_block              = var.subnet_cidr_blocks[count.index]
  map_public_ip_on_launch = true
  availability_zone       = var.avaial_zones[count.index]
  tags = {
    Name = var.subnet_names[count.index]
  }
}
#Creation of the internet gateway
resource "aws_internet_gateway" "app-igw" {
  vpc_id = aws_vpc.app-vpc.id
  tags = {
    Name = "${var.env_prefix}-IGW"
  }
}

#Creation of the route table
resource "aws_route_table" "app-rtable" {
  vpc_id = aws_vpc.app-vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.app-igw.id
  }
  tags = {
    Name = "Public-RT"
  }
}

