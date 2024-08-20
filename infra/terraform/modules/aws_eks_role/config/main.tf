# Define a Terraform data block for fetching secrets from a sops-encrypted file, conditionally enabled based on the existence of the source file.
data "sops_file" "secrets" {
  count       = local.sops_file_exists ? 1 : 0
  source_file = local.sops_source_file
}
# Define local variables for better readability and reusability.
locals {
  config_path      = var.config_path != "" ? var.config_path : "${path.root}/config"
  environment      = var.environment != "" ? var.environment : terraform.workspace
  sops_source_file = "${local.config_path}/${local.environment}/secrets.enc.yaml"
  sops_file_exists = fileexists(local.sops_source_file)

  # Fetch secrets from the sops data block if it exists, otherwise an empty map.
  secrets = local.sops_file_exists ? data.sops_file.secrets[0].data : {}

  # Define template variables for use in template files.
  tpl_vars = {
    secrets     = var.enable_config_secrets ? local.secrets : {}
    environment = local.environment
    terraform = {
      workspace = terraform.workspace
    }
  }

  # exclude .enc.yaml files
  files_base = toset([for f in fileset(local.config_path, "*.yaml") : f if substr(f, -9, -1) != ".enc.yaml"])
  files_env  = toset([for f in fileset("${local.config_path}/${local.environment}", "*.yaml") : f if substr(f, -9, -1) != ".enc.yaml"])

  configs_base = [for f in local.files_base : yamldecode(templatefile("${local.config_path}/${f}", local.tpl_vars))]
  configs_env  = [for f in local.files_env : yamldecode(templatefile("${local.config_path}/${local.environment}/${f}", local.tpl_vars))]

  config_env  = merge(local.configs_env...)
  config_base = merge(local.configs_base...)

  configs     = merge(local.config_base, local.config_env)
  secret_data = merge(local.configs, local.secrets)
}