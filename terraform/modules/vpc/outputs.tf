output "vpc_id" {
  value = aws_vpc.app-vpc.id
}
output "subnet_id_list" {
  value = aws_subnet.app-subnet[*].id
}
output "route_table_id" {
  value = aws_route_table.app-rtable.id
}
