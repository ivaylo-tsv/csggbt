output "vpc_id" {
  value = aws_vpc.csggbt-vpc.id
}

output "subnet_private_1" {
  value = aws_subnet.csggbt-subnet-private-1.id
}

output "subnet_private_2" {
  value = aws_subnet.csggbt-subnet-private-2.id
}

output "subnet_public_1" {
  value = aws_subnet.csggbt-subnet-public-1.id
}

output "subnet_public_2" {
  value = aws_subnet.csggbt-subnet-public-2.id
}