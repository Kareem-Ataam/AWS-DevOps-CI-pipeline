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
variable "vpc_id" {
  type        = string
  description = "The VPC id in which the subnets will be created"
}
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
variable "subnet_id_list" {
  type        = list(string)
  description = "List of subnet IDs in which the subnets will be created"
}
variable "instance_name_list" {
  type        = list(string)
  description = "List of instance names"
}
variable "user_data_file_paths" {
  type = list(string)
  description = "List of user data script paths"
}
variable "iam_instance_profile" {
  type = string
  description = "S3 profile name"
}