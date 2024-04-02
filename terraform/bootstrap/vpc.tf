## VPC & Subnets

resource "aws_vpc" "csggbt-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = merge(
    { "Name" : "csggbt-vpc" },
    var.tags
  )
}

resource "aws_subnet" "csggbt-subnet-public" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.0/26"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "true"

  tags = merge({
    Name = "csggbt-subnet-public"},
    var.public_subnet_tags,
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-private-1" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.64/26"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-private-1"},
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-private-2" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.192/26"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-private-2"},
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-database" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.128/26"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-database"},
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
  subnet_id     = aws_subnet.csggbt-subnet-public.id

  tags = merge(
    { "Name" = "csggbt-nat-gw"},
    var.tags
    )
}

## Elastic IPs

resource "aws_eip" "csggbt-nat-gw-eip" {}