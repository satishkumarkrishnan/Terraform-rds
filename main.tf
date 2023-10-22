terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0.0"
    }
  }
}

#To use the VPC module already created
module "rds" {
  source               = "git@github.com:satishkumarkrishnan/terraform-aws-vpc.git"
  name                 = "tokyo_rds_vpc"
  #cidr                 = ""
  azs                  = data.aws_availability_zones.available
 # public_subnets       = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]
  enable_dns_hostnames = true
  enable_dns_support   = true
}

#To Create RDS using TF
/*resource "aws_db_instance" "terraform_rds" {
  allocated_storage    = 1
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_name
  password             = var.db_password  
  db_subnet_group_name = data.aws_db_subnet_group.terraform_subnet_group.name
  vpc_security_group_ids = [aws_vpc.vpc_security_group_ids]
  parameter_group_name =  aws_db_parameter_group.terraform_db_param.name
  skip_final_snapshot  = true
}

#To Create DB Subnet Group Name
resource "aws_db_subnet_group" "terraform_subnet_group" {
  name       = "tokyo_db_subnet"
  count      = length(data.aws_subnet.fe_subnet.id)
  subnet_ids = data.vpc_fe_subnet.cidr_block[count].ipv6_cidr_block
    tags = {
    Name = "tokyo_db_subnet"
  }  
}

#To Create DB Parameter Group Name 
resource "aws_db_parameter_group" "terraform_db_param" {
  name   = "education"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}*/