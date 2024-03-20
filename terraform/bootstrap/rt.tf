## Route tables 

resource "aws_route_table" "csggbt-rt-public" {
  vpc_id = aws_vpc.csggbt-vpc.id

  route {
    cidr_block = "10.0.0.0/26"
    gateway_id = aws_internet_gateway.csggbt-igw.id
  }

  tags = merge(
    { "Name": "csggbt-rt-public "},
    var.tags
  )
}