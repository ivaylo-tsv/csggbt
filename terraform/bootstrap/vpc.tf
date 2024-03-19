resource "aws_vpc" "csggbt-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = merge(
    { "Name" : "csggbt-vpc" },
    var.tags
  )
}

resource "aws_subnet" "csggbt-subnet-public" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.1/24"
  availability_zone       = "eu-west-1a"
  map_public_ip_on_launch = "true"

  tags = merge({
    Name = "csggbt-subnet-public"},
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-private" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.2/24"
  availability_zone       = "eu-west-1b"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-private"},
    var.tags)
}

resource "aws_subnet" "csggbt-subnet-database" {
  vpc_id                  = aws_vpc.csggbt-vpc.id
  cidr_block              = "10.0.0.3/24"
  availability_zone       = "eu-west-1c"
  map_public_ip_on_launch = "false"

  tags = merge({
    Name = "csggbt-subnet-database"},
    var.tags)
}