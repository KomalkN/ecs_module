# Resource to creating VPC
resource "aws_vpc" "vpc" {
  cidr_block = var.vpc_cidr_block
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-vpc"
  }
}

# Resource to creating VPC dhcp options
resource "aws_vpc_dhcp_options" "vpc_dhcp_options" {
  domain_name         = var.domain_name
  domain_name_servers = var.domain_name_servers

  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-vpc-dhcp-options"
  }
}

# Resource to creating VPC dhcp options association
resource "aws_vpc_dhcp_options_association" "vpc_dhcp_options_association" {
  vpc_id          = aws_vpc.vpc.id
  dhcp_options_id = aws_vpc_dhcp_options.vpc_dhcp_options.id
}