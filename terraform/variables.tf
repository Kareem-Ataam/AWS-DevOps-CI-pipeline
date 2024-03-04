variable "aws_region" {
  type        = string
  description = "The region the infrastructure will be in"

}
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
###############################################
variable "number_of_sgs" {
  type        = number
  description = "number of security groups you need to create"
  default     = 3
}
variable "sg_names" {
  type        = list(string)
  description = "Names of the security groups"
}
variable "descriptions" {
  type        = list(string)
  description = "List of the descriptions for the security groups to create"
}
#variable "vpc_id" {
#  type        = string
#  description = "The VPC id in which the subnets will be created"
#}
variable "name_tags" {
  type        = list(string)
  description = "List of strings that will be used as tag names"
}
variable "ingress_rules" {
  type = list(list(object({
    from_port   = number
    to_port     = number
    protocol    = string
    cidr_blocks = list(string)
  })))
}
variable "public_key_path" {
  type        = string
  description = "The path of the ssh public key"
}
variable "ami_list" {
  type        = list(string)
  description = "List of the AMIs"
}
variable "instance_type_list" {
  type        = list(string)
  description = "List of instance types"
}
#variable "subnet_id_list" {
#  type        = list(string)
#  description = "List of subnet IDs in which the subnets will be created"
#}
variable "instance_name_list" {
  type        = list(string)
  description = "List of instance names"
}
variable "user_data_file_paths" {
  type        = list(string)
  description = "List of user data script paths"
}
variable "bucket_name" {
  type        = string
  description = "A globally unique name for the bucket"
}
variable "s3_name_tag" {
  type = string
}
