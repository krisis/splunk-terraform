output "vpc_id" {
  value = aws_vpc.my_vpc.id
}

output "subnet_id" {
  value = aws_subnet.my_subnet.id
}

output "gateway_id" {
  value = aws_internet_gateway.my_gw.id
}

output "route_table_id" {
  value = aws_route_table.my_route_table.id
}

output "route_assoc_id" {
  value = aws_route_table_association.my_subnet_assoc.id
}

output "ingress_id" {
  value = aws_security_group.my_ingress_all_test.id
}

