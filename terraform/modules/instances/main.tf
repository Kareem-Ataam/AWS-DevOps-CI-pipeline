#Creation of the security groups
resource "aws_security_group" "app-sg" {
  count       = var.number_of_sgs
  name        = var.sg_names[count.index]
  description = var.descriptions[count.index]
  vpc_id      = var.vpc_id
  tags = {
    Name = var.name_tags[count.index]
  }
  #Dynamic block allow us to generate multiple instances of a block based on a list length
  dynamic "ingress" {
    for_each = var.ingress_rules[count.index]
    content {
      from_port   = ingress.value["from_port"]
      to_port     = ingress.value["to_port"]
      protocol    = ingress.value["protocol"]
      cidr_blocks = ingress.value["cidr_blocks"]
    }
  }
  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }
}
#Creation of the key pair
resource "aws_key_pair" "ssh-key" {
  key_name   = "my-key"
  public_key = file(var.public_key_path)
}
#Creation of the instances
resource "aws_instance" "machine" {
  count                  = length(var.ami_list)
  ami                    = var.ami_list[count.index]
  instance_type          = var.instance_type_list[count.index]
  subnet_id              = var.subnet_id_list[count.index]
  key_name               = aws_key_pair.ssh-key.key_name
  vpc_security_group_ids = [aws_security_group.app-sg[count.index].id]
  user_data              = file(var.user_data_file_paths[count.index])
  tags = {
    Name = var.instance_name_list[count.index]
  }
}
