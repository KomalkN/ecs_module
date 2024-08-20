# Output blocks for exposing all configurations and secrets
output "configs" {
  description = "All configs"
  value       = local.configs
}

output "secret_data" {
  description = "All secrets"
  value       = local.secret_data
}