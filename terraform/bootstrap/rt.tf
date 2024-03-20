## Route tables

resource "aws_route_table" "csggbt-rt-public" {
  vpc_id = aws_vpc.csggbt-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.csggbt-igw.id
  }

  tags = merge(
    { "Name" : "csggbt-rt-public " },
    var.tags
  )
}

resource "aws_route_table" "csggbt-rt-private" {
  vpc_id = aws_vpc.csggbt-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_nat_gateway.csggbt-nat-gw.id
  }

  tags = merge(
    { "Name" : "csggbt-rt-private " },
    var.tags
  )
}

## Subnet associations

resource "aws_route_table_association" "csggbt-subnet-association-public" {
  subnet_id      = aws_subnet.csggbt-subnet-public.id
  route_table_id = aws_route_table.csggbt-rt-public.id
}

resource "aws_route_table_association" "csggbt-subnet-association-private" {
  for_each       = local.private_subnets
  subnet_id      = each.value
  route_table_id = aws_route_table.csggbt-rt-private.id
}
