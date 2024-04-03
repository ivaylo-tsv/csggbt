locals {
  private_subnets = merge({ "private-subnet-1" : "${aws_subnet.csggbt-subnet-private-1.id}" }, { "private-subnet-2" : "${aws_subnet.csggbt-subnet-private-2.id}" })
  public_subnets  = merge({ "public-subnet-1" : "${aws_subnet.csggbt-subnet-public-1.id}" }, { "public-subnet-2" : "${aws_subnet.csggbt-subnet-public-2.id}" })
}
