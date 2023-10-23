terraform {
  required_version = ">= 1.0.0, < 2.0.0"

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0.0"
    }
  }
}

#To use the VPC module already created
module "rds" {
  source    = "git@github.com:satishkumarkrishnan/terraform-aws-vpc.git?ref=main"   
   
}

#To Create RDS using TF
resource "aws_db_instance" "terraform_rds" {
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_name
  password             = var.db_password  
  db_subnet_group_name = data.aws_db_subnet_group.database.name
  vpc_security_group_ids = [module.rds.vpc_fe_sg]
  parameter_group_name =  aws_db_parameter_group.terraform_db_param.name
  skip_final_snapshot  = true
}

#To Create DB Subnet Group Name
resource "aws_db_subnet_group" "terraform_subnet_group" {
  name       = "tokyo_db_subnet"
  subnet_ids = [module.rds.vpc_fe_subnet.id, module.rds.vpc_be_subnet.id]
    tags = {
    Name = "tokyo_db_subnet"
  }  
}

#To Create DB Parameter Group Name 
resource "aws_db_parameter_group" "terraform_db_param" {
  name   = "education"
  family = "mysql5.7"  
}