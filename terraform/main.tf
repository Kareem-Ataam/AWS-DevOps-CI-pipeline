module "vpc" {
  source               = "./modules/vpc"
  cidr_block           = var.cidr_block
  env_prefix           = var.env_prefix
  subnet_cidr_blocks   = var.subnet_cidr_blocks
  subnet_names         = var.subnet_names
  avaial_zones         = var.avaial_zones
  enable_dns_support   = var.enable_dns_support
  enable_dns_hostnames = var.enable_dns_hostnames
}
module "instances" {
  source               = "./modules/instances"
  number_of_sgs        = var.number_of_sgs
  sg_names             = var.sg_names
  descriptions         = var.descriptions
  name_tags            = var.name_tags
  ingress_rules        = var.ingress_rules
  public_key_path      = var.public_key_path
  ami_list             = var.ami_list
  instance_type_list   = var.instance_type_list
  instance_name_list   = var.instance_name_list
  vpc_id               = module.vpc.vpc_id
  subnet_id_list       = module.vpc.subnet_id_list
  user_data_file_paths = var.user_data_file_paths
}
#Creation of subnet associations
resource "aws_route_table_association" "subnet-rt" {
  count          = length(module.vpc.subnet_id_list)
  subnet_id      = module.vpc.subnet_id_list[count.index]
  route_table_id = module.vpc.route_table_id
}
