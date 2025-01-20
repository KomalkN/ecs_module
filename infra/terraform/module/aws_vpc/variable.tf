variable "vpc_id" {
  type        = string
  description = "The ID of vpc"
  default     = ""
}
variable "vpc_cidr_block" {
  type = string
}
variable "public_subnet_conf" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}
variable "private_subnet_conf" {
  type = map(object({
    name              = string
    cidr_block        = string
    availability_zone = string
  }))
  default = {}
}
variable "domain_name" {
  type = string
}
variable "domain_name_servers" {
  type = list(string)
}
variable "igw_id" {
  description = "The ID of Internet Gateway"
  type        = string
  default     = ""
}
variable "nat_gateway_id" {
  description = "The ID of the NAT gateway for the private route table."
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