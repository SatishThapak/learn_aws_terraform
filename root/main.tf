module "networking" {
  source               = "../modules/networking"
  vpc_cidr             = var.vpc_cidr
  vpc_name             = var.vpc_name
  public_subnet        = var.public_subnet
  availability_zone    = var.availability_zone
  private_subnet       = var.private_subnet
}


module "security-group" {
  source                     = "../modules/security-groups"
  ec2_sg_name                = "dev-project-ec2-sg"
  vpc_id                     = module.networking.dev_project_vpc_id
  public_subnet   = tolist(module.networking.dev_project_public_subnets)
}

module "EC2_instance" {
  source                   = "../modules/EC2_instance"
  ami_id                   = var.ami_id
  instance_type            = "t2.micro"
  tag_name                 = "Ubuntu Linux EC2"
  public_key               = var.public_key
  subnet_id                = tolist(module.networking.dev_project_public_subnets)[0]
  sg_enable_ssh_https      = module.security-group.dev-project-ec2-sg_id
  enable_public_ip_address = true
  user_data_install_apache = ""
}
