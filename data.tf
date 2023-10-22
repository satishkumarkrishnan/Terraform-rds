data "aws_subnet" "vpc_fe_subnet" {
  depends_on = [module.rds]
  filter {
    name   = "tag:Name"
    values = ["tokyo-subnets-0"] # insert value here  
  }  
}

data "aws_db_subnet_group" "database" {
  name = "tokyo_db_subnet"
  depends_on = [module.rds]
}

data "aws_availability_zones" "available" {
  state = "available"
}

/*data "aws_security_groups" "test" {  
  filter {
    name   = "sg-id"
    values = ["${aws_vpc.}"]
  }
}*/