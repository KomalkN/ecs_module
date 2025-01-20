# Resource to create s3 bucket policy
resource "aws_s3_bucket_policy" "s3_bucket_policy" {
  bucket = var.bucket_id
  policy = jsonencode({
    "Version" : "2008-10-17",
    "Id" : "PolicyForCloudFrontPrivateContent",
    "Statement" : [
      {
        "Sid" : "AllowCloudFrontServicePrincipal",
        "Effect" : "Allow",
        "Principal" : {
          "Service" : "cloudfront.amazonaws.com"
        },
        "Action" : "s3:GetObject",
        "Resource" : "arn:aws:s3:::${var.bucket_name}/*",
        "Condition" : {
          "StringEquals" : {
            "AWS:SourceArn" : "arn:aws:cloudfront::306611214346:distribution/${aws_cloudfront_distribution.my_distribution.id}"
          }
        }
      }
    ]
  })
}

# Resource to create cloudfront origin access control
resource "aws_cloudfront_origin_access_control" "cloudfront_origin_access_control" {
  name                              = "${var.org_name}-${var.app_name}-${var.service_name}-${terraform.workspace}-oac"
  description                       = "OAC for saas s3 ui"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}

# Resource to create cloudfront distribution
resource "aws_cloudfront_distribution" "my_distribution" {
  origin {
    domain_name              = var.bucket_regional_domain_name
    origin_access_control_id = aws_cloudfront_origin_access_control.cloudfront_origin_access_control.id
    origin_id                = var.bucket_name
  }
  aliases             = var.aliases
  enabled             = true
  is_ipv6_enabled     = true
  comment             = var.cloudfront_description
  default_root_object = var.default_root_object
  default_cache_behavior {
    allowed_methods  = var.allowed_methods
    cached_methods   = ["GET", "HEAD"]
    target_origin_id = var.bucket_name
    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
    viewer_protocol_policy = "redirect-to-https"
    min_ttl                = 0
    default_ttl            = 3600
    max_ttl                = 86400
  }
  restrictions {
    geo_restriction {
      restriction_type = "none"
    }
  }
  viewer_certificate {
    cloudfront_default_certificate = true
    # acm_certificate_arn            = var.acm_certificate
    # ssl_support_method             = var.ssl_support_method
    # minimum_protocol_version       = var.minimum_protocol_version
  }
}