# Resource to creating a route table for the public subnet
resource "aws_route_table" "public_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway.id
  }
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-ig-rt"
  }
}

# Resource to creating a route table for the nat gateway
resource "aws_route_table" "nat_gateway_route_table" {
  vpc_id = aws_vpc.vpc.id
  route {
    cidr_block     = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.nat_gateway.id
  }
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-ng-rt"
  }
}

# Resource to associate public subnet 1 with public route table
resource "aws_route_table_association" "public_subnet_1_association" {
  subnet_id      = aws_subnet.public_subnet["public_subnet_1"].id
  route_table_id = aws_route_table.public_route_table.id
}

# Resource to associate public subnet 2 with public route table
resource "aws_route_table_association" "public_subnet_2_association" {
  subnet_id      = aws_subnet.public_subnet["public_subnet_2"].id
  route_table_id = aws_route_table.public_route_table.id
}

# Resource to associate public subnet 3 with public route table
resource "aws_route_table_association" "public_subnet_3_association" {
  subnet_id      = aws_subnet.public_subnet["public_subnet_3"].id
  route_table_id = aws_route_table.public_route_table.id
}

# Resource to associate private subnet 1 with nAT gateway route table
resource "aws_route_table_association" "nat_gateway_route_table_association" {
  subnet_id      = aws_subnet.private_subnet["private_subnet_1"].id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}

# Resource to associate private subnet 2 with nAT gateway route table
resource "aws_route_table_association" "nat_gateway_route_table_association_2" {
  subnet_id      = aws_subnet.private_subnet["private_subnet_2"].id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}

# Resource to associate private subnet 3 with nAT gateway route table
resource "aws_route_table_association" "nat_gateway_route_table_association_3" {
  subnet_id      = aws_subnet.private_subnet["private_subnet_3"].id
  route_table_id = aws_route_table.nat_gateway_route_table.id
}