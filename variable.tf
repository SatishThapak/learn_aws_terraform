variable "bucket_name" {
  type        = string
  description = "Remote state bucket name"
}
variable "name" {
  type        = string
  description = "Tag name"
}
variable "environment" {
  type        = string
  description = "Environment name"
}
variable "vpc_cidr" {
  type        = string
  description = "Public Subnet "
}
variable "vpc_name" {
  type        = string
  description = "VPC"
}
variable "public_subnet" {
  type        = list(string)
  description = "Public Subnet"
}
variable "private_subnet" {
  type        = list(string)
  description = "Private Subnet"
}
variable "availability_zone" {
  type        = list(string)
  description = "Availability Zones"
}

variable "public_key" {
  type        = string
  description = "Public key for EC2 instance"
}

variable "ami_id" {
  type        = string
  description = "AMI Id for EC2 instance"
}

variable "user_data_install_apache" {
  type = string
  description = "Script for installing the Apache2"
}

