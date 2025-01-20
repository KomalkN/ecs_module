variable "bucket_name" {
  description = "The name of the S3 bucket"
  type        = string
  default     = ""
}
variable "bucket_id" {
  description = "The id of the S3 bucket"
  type        = string
  default     = ""
}
variable "bucket_regional_domain_name" {
  description = "The regional domain name of the S3 bucket"
  type        = string
  default     = ""
}
variable "org_name" {
  type        = string
  description = "organisation name"
  default     = "nt"
}
variable "app_name" {
  type        = string
  description = "application name"
  default     = "nexusway"
}
variable "cloudfront_description" {
  type        = string
  description = "CloudFront description"
  default     = ""
}
variable "allowed_methods" {
  type        = list(string)
  description = "CloudFront allowed methods"
  default     = []
}
variable "default_root_object" {
  type        = string
  description = "CloudFront default root object"
  default     = ""
}
variable "aliases" {
  type        = list(string)
  description = "CloudFront aliases"
  default     = []
}
variable "ssl_support_method" {
  type        = string
  description = "ssl_support_method"
  default     = "sni-only"
}
variable "minimum_protocol_version" {
  type        = string
  description = "minimum_protocol_version"
  default     = "TLSv1"
}
variable "acm_certificate" {
  type        = string
  description = "ACM certificate arn"
  default     = ""
}
variable "service_name" {
  description = "Service name"
  type        = string
  default     = ""
}