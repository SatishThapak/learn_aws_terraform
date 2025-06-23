variable "ami_id" {}
variable "instance_type" {}
variable "tag_name" {}
variable "public_key" {}
variable "subnet_id" {}
variable "sg_enable_ssh_https" {}
variable "enable_public_ip_address" {}
variable "user_data_install_apache" {}

output "dev_project_ec2_instance_id" {
  value = aws_instance.dev_project_ec2_instace.id
}

resource "aws_instance" "dev_project_ec2_instace" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name   = "deployer-key"
  subnet_id                   = var.subnet_id
  vpc_security_group_ids      = [var.sg_enable_ssh_https]
  associate_public_ip_address = var.enable_public_ip_address
 tags = {
    Name = var.tag_name
  }
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJTaxutse2R3iQPVEu2nQOuZMwcq2TZxJD/2SLS77M/xn4dpz/TWmIGuELbPtmOWpcp7BPkzJFdndZKQ+Qy1BZQm3oMpPz0St7vSRnGfD9szqyybeUoLROUjyAwGQKXDfzTZLqMUMPtxdpyJ1rxIGxVqyR34kbBx2dlp1GWRGZbc7/yiwq3OIIMqmec1nj4TEV9QtDnSDcVgqif5SVA6jRv025LAp9Iycq45Om9nUqI3Yu25XVTAZt4jF4htb2KXoUmvwsNLEm0yIr5qDdAIQD7bgpRCg06h/0yngID93bi7g1RiAcYYi7PD4Wto1p055b/d6Q1XRmEJwo+yP4uTKySnnJf8SMwrQtx1fx0QFGdzo7Qa7T5r2Ym4U7mW58M9eQIyUwzn1hG5XmnsYwhTsHu45zW/4QqjKjlNMeMxNxV9YLPepeOUK/Mvnd4GTosv7q1FBPs4xwsQKz3VgbuIPJBhb8S9LdQoacQFxRXU8hG5pm+h80KfDyF2Dg95tSfcM= qolsysjci@jthapasa"

}

