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
module "rds_vpc" {
  source         = "git@github.com:satishkumarkrishnan/terraform-aws-vpc.git?ref=main"  
  azs            =  data.aws_availability_zones.available.names
  count           = length(data.aws_subnet.vpc_fe_subnet)
  private_subnet = [data.aws_subnet.vpc_fe_subnet[count.index].id]
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
  #db_subnet_group_name = data.aws_db_subnet_group.terraform_subnet_group.name
  vpc_security_group_ids = [module.rds_vpc.vpc_fe_sg]
  parameter_group_name =  aws_db_parameter_group.terraform_db_param.name
  skip_final_snapshot  = true
}

#To Create DB Subnet Group Name
resource "aws_db_subnet_group" "terraform_subnet_group" {
  name       = "tokyo_db_subnet"
  count      = length(data.aws_subnet.fe_subnet.id)
  subnet_ids = module.rds_vpc.vpc_fe_subnet.cidr_block[count].ipv6_cidr_block
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