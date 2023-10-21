#To use the VPC module already created
module "rds_vpc" {
  source  = "git@github.com:satishkumarkrishnan/terraform-aws-vpc.git?ref=main"
}

# To create AWS RDS Instance role assciation with IAM using Terraform
/*resource "aws_db_instance_role_association" "terraform_IAM_RDS" {
  db_instance_identifier = aws_db_instance.terraform_rds.identifier
  feature_name           = "S3_INTEGRATION"
  role_arn               = aws_iam_role.terraform_IAM_RDS.arn
#  role_arn               = arn:aws:iam::515149434592:role/Terraform_IAM_RDS
}*/

#To Create RDS using TF
resource "aws_db_instance" "terraform_rds" {
  allocated_storage    = 1
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = var.db_name
  password             = var.db_password
  db_subnet_group_name = var.db_subnet_group_name
  vpc_security_group_ids = [module.aws_db_instance.vpc_fe_sg]  
  parameter_group_name =  aws_db_parameter_group.education.name
  skip_final_snapshot  = true
}

resource "aws_db_parameter_group" "education" {
  name   = "education"
  family = "postgres14"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}