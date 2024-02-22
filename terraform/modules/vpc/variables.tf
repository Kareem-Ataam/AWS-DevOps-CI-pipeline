variable "cidr_block" {
  type        = string
  description = "The CIDR block of the VPC"
  default     = "10.0.0.0/16"
}
variable "env_prefix" {
  type        = string
  description = "value to prefix environment tags with, e.g., 'dev-' or 'prod-'"
}
variable "subnet_cidr_blocks" {
  type        = list(string)
  description = "List of the subnet CIDR blocks used for the subnets creation"
  default     = ["10.0.0.0/24", "10.0.1.0/24", "10.0.2.0/24"] #Number of subnets to create will depend on the this list length
}
variable "subnet_names" {
  type        = list(string)
  description = "List of subnet names"
  default     = ["subnet-1", "subnet-2", "subnet-3"]
}
variable "avaial_zones" {
  type        = list(string)
  description = "List of the availability zones to creat the subnets in"
}
variable "enable_dns_support" {
  type = bool
}
variable "enable_dns_hostnames" {
  type = bool
}
