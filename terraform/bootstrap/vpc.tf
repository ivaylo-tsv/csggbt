## VPC & Subnets

resource "aws_vpc" "csggbt-vpc" {
  cidr_block = "10.0.0.0/20"

  tags = merge(
    { "Name" : "csggbt-vpc" },
    var.tags
  )
}

resource "aws_subnet" "csggbt-subnet-public-1" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "true"

  tags = merge({
    Name = "csggbt-subnet-public-1"},
    var.public_subnet_tags,
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-public-2" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.1.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "true"

  tags = merge({
    Name = "csggbt-subnet-public-2"},
    var.public_subnet_tags,
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-private-1" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.2.0/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-private-1"},
    var.private_subnet_tags,
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-private-2" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.3.0/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-private-2"},
    var.private_subnet_tags,
    var.tags)
}


## IGW & NAT GW

resource "aws_internet_gateway" "csggbt-igw" {
  vpc_id = aws_vpc.csggbt-vpc.id

  tags = merge(
    { "Name" = "csggbt-igw"},
    var.tags
  )
}

resource "aws_nat_gateway" "csggbt-nat-gw" {
  allocation_id = aws_eip.csggbt-nat-gw-eip.id
  subnet_id     = aws_subnet.csggbt-subnet-public-1.id

  tags = merge(
    { "Name" = "csggbt-nat-gw"},
    var.tags
    )
}

## Elastic IPs

resource "aws_eip" "csggbt-nat-gw-eip" {}