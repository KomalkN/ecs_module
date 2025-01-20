# Output for cloudfront distribution id
output "cloudfront_distribution_id" {
  value = aws_cloudfront_distribution.my_distribution.id
}
# Output for cloudfront domain name
output "cloudfront_domain_name" {
  value = aws_cloudfront_distribution.my_distribution.domain_name
}