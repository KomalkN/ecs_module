# Resource to create s3 bucket
resource "aws_s3_bucket" "s3_bucket" {
  bucket = "${var.org_name}-${var.app_name}-${var.service_name}-${terraform.workspace}-bucket"
  tags = {
    Name        = "${var.org_name}-${var.app_name}-${var.service_name}-${terraform.workspace}-bucket"
    Environment = "${terraform.workspace}"
  }
}