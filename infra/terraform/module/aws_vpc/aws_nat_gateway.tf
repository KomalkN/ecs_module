# Resource to creating elastic ip
resource "aws_eip" "eip_nat_gateway" {
  domain = "vpc"
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-eip"
  }
}

# Resource to creating nat gateway
resource "aws_nat_gateway" "nat_gateway" {
  allocation_id = aws_eip.eip_nat_gateway.id
  subnet_id     = aws_subnet.public_subnet["public_subnet_1"].id
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-ng"
  }
}