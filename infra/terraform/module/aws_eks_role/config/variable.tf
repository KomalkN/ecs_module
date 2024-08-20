variable "enable_config_secrets" {
  description = "Inject secrets into config templates"
  type        = bool
  default     = false
}
variable "config_path" {
  description = "Path to configs"
  type        = string
  default     = ""
}
variable "environment" {
  description = "The environment (default to $terraform.workspace)"
  type        = string
  default     = ""
}