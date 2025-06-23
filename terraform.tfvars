bucket_name = "dev-project-bucket-19062025"
name        = "environment"
environment = "dev"


vpc_cidr             = "10.0.0.0/16"
vpc_name             = "dev_project_vpc"
public_subnet   = ["10.0.1.0/24", "10.0.2.0/24"]
private_subnet  = ["10.0.3.0/24", "10.0.4.0/24"]
availability_zone = ["ap-south-1a", "ap-south-1b"]



ami_id     = "ami-0f918f7e67a3323f0"
user_data_install_apache = ""
public_key = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDJTaxutse2R3iQPVEu2nQOuZMwcq2TZxJD/2SLS77M/xn4dpz/TWmIGuELbPtmOWpcp7BPkzJFdndZKQ+Qy1BZQm3oMpPz0St7vSRnGfD9szqyybeUoLROUjyAwGQKXDfzTZLqMUMPtxdpyJ1rxIGxVqyR34kbBx2dlp1GWRGZbc7/yiwq3OIIMqmec1nj4TEV9QtDnSDcVgqif5SVA6jRv025LAp9Iycq45Om9nUqI3Yu25XVTAZt4jF4htb2KXoUmvwsNLEm0yIr5qDdAIQD7bgpRCg06h/0yngID93bi7g1RiAcYYi7PD4Wto1p055b/d6Q1XRmEJwo+yP4uTKySnnJf8SMwrQtx1fx0QFGdzo7Qa7T5r2Ym4U7mW58M9eQIyUwzn1hG5XmnsYwhTsHu45zW/4QqjKjlNMeMxNxV9YLPepeOUK/Mvnd4GTosv7q1FBPs4xwsQKz3VgbuIPJBhb8S9LdQoacQFxRXU8hG5pm+h80KfDyF2Dg95tSfcM= qolsysjci@jthapasa"
