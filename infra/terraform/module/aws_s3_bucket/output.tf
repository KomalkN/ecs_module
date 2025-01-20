# Output for s3 bucket name
output "bucket_name" {
  value = aws_s3_bucket.s3_bucket.bucket
}
# Output for s3 bucket id
output "bucket_id" {
  value = aws_s3_bucket.s3_bucket.id
}
# Output for s3 bucket domain name
output "bucket_regional_domain_name" {
  value = aws_s3_bucket.s3_bucket.bucket_regional_domain_name
}