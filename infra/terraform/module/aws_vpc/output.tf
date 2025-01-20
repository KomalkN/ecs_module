# Output for VPC id
output "vpc_id" {
  value = aws_vpc.vpc.id
}
# Output for VPC dhcp options id
output "dhcp_options_id" {
  value = aws_vpc_dhcp_options.vpc_dhcp_options.id
}
# Output for public subnet ids
output "public_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.public_subnet : key => subnet.id
  }
}
# Output for private subnet ids
output "private_subnet_ids" {
  value = {
    for key, subnet in aws_subnet.private_subnet : key => subnet.id
  }
}
# Output for the id of the created nat gateway.
output "nat_gateway_id" {
  value = aws_nat_gateway.nat_gateway.id
}
#  Output for the id of the allocated Elastic IP address.
output "eip_allocation_id" {
  value = aws_eip.eip_nat_gateway.allocation_id
}
# Output for the id of the internet gateway
output "igw_id" {
  value = aws_internet_gateway.internet_gateway.id
}