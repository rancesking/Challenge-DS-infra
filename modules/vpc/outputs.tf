output "public_subnets" {
  value = aws_subnet.public_subnets[*].id
}

output "vpc_id" {
  value = aws_vpc.main_vpc.id
}

output "sg" {
  value = aws_security_group.cluster_sg.id
}
