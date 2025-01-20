# Resource to creating internet gateway
resource "aws_internet_gateway" "internet_gateway" {
  vpc_id = aws_vpc.vpc.id
  tags = {
    Name = "${var.org_name}-${var.app_name}-${terraform.workspace}-ig"
  }
}