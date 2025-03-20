resource "aws_vpc" "data-vpc" {
  cidr_block           = var.vpc-cidr-block
  enable_dns_support   = true
  enable_dns_hostnames = true
  tags = {
    name  = var.vpc-name
    owner = var.owner
  }
}
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.main.id
  tags = {
    Name = "${var.project}-igw"
  }
}