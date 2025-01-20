# Resource to creating public subnets
resource "aws_subnet" "public_subnet" {
  for_each                = var.public_subnet_conf
  vpc_id                  = aws_vpc.vpc.id
  cidr_block              = each.value.cidr_block
  availability_zone       = each.value.availability_zone
  map_public_ip_on_launch = true
  tags = {
    Name                     = "${var.org_name}-${var.app_name}-${terraform.workspace}-${each.value.name}"
    "kubernetes.io/role/elb" = "1"
  }
}

# Resouce to creating private subnets
resource "aws_subnet" "private_subnet" {
  for_each          = var.private_subnet_conf
  vpc_id            = aws_vpc.vpc.id
  cidr_block        = each.value.cidr_block
  availability_zone = each.value.availability_zone
  tags = {
    Name                              = "${var.org_name}-${var.app_name}-${terraform.workspace}-${each.value.name}"
    "kubernetes.io/role/internal-elb" = "1"
  }
}