resource "aws_vpc" "csggbt-vpc" {
  cidr_block = "10.0.0.0/24"

  tags = merge(
    {"Name": "csggbt-vpc"},
    var.tags
  )
}

