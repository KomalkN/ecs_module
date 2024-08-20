# Define local variables
locals {
  configs = module.config.configs # Retrieve configurations from the config module
  secrets = module.config.secret_data
}

# Invoke config module to configure common settings
module "config" {
  source                = "./modules/config"
  enable_config_secrets = false
}

# Invoke Kubernetes roles module to set up EKS roles
module "kubernetes_roles" {
  source          = "./modules/aws_eks_role"
  oidc_issuer_url = module.kubernetes.oidc_issuer_url
}