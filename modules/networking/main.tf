variable "vpc_cidr" {}
variable "vpc_name" {}
variable "public_subnet" {}
variable "private_subnet" {}
variable "availability_zone" {}


output "dev_project_vpc_id" {
  value = aws_vpc.dev_project_ap-south-1_vpc.id
}

output "dev_project_public_subnets" {
  value = aws_subnet.dev_project_public_subnets.*.id
}

output "dev_project_public_subnet_cidr_block" {
  value = aws_subnet.dev_project_public_subnets.*.cidr_block
}

# Setup VPC
resource "aws_vpc" "dev_project_ap-south-1_vpc" {
  cidr_block = var.vpc_cidr
  tags = {
    Name = var.vpc_name
  }
}

# Setup public subnet
resource "aws_subnet" "dev_project_public_subnets" {
  count             = length(var.public_subnet)
  vpc_id            = aws_vpc.dev_project_ap-south-1_vpc.id
  cidr_block        = element(var.public_subnet, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "dev-project-public-subnet-${element(var.availability_zone, count.index)}"
  }
}

resource "aws_subnet" "dev_project_private_subnets" {
  count             = length(var.private_subnet)
  vpc_id            = aws_vpc.dev_project_ap-south-1_vpc.id
  cidr_block        = element(var.private_subnet, count.index)
  availability_zone = element(var.availability_zone, count.index)

  tags = {
    Name = "dev-project-private-subnet-${element(var.availability_zone, count.index)}"
  }
}

# Setup Internet Gateway
resource "aws_internet_gateway" "dev_project_internet_gateway" {
  vpc_id = aws_vpc.dev_project_ap-south-1_vpc.id
  tags = {
    Name = "dev-project-igw"
  }
}


# Public Route Table
resource "aws_route_table" "dev_project_public_route_table" {
  vpc_id = aws_vpc.dev_project_ap-south-1_vpc.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev_project_internet_gateway.id
  }
  tags = {
    Name = "dev-project-public-rt"
  }
}

# Public Route Table and Public Subnet Association
resource "aws_route_table_association" "dev_project_public_rt_subnet_association" {
  count          = length(aws_subnet.dev_project_public_subnets)
  subnet_id      = aws_subnet.dev_project_public_subnets[count.index].id
  route_table_id = aws_route_table.dev_project_public_route_table.id
}


# Private Route Table
resource "aws_route_table" "dev_project_private_route_table" {
  vpc_id = aws_vpc.dev_project_ap-south-1_vpc.id
  #depends_on = [aws_nat_gateway.nat_gateway]
  tags = {
    Name = "dev-project-private-rt"
  }
}

# Private Route Table and private Subnet Association
resource "aws_route_table_association" "dev_project_private_rt_subnet_association" {
  count          = length(aws_subnet.dev_project_private_subnets)
  subnet_id      = aws_subnet.dev_project_private_subnets[count.index].id
  route_table_id = aws_route_table.dev_project_private_route_table.id
}
