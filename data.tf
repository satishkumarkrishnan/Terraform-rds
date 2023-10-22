
data "aws_subnet" "vpc_fe_subnet" {
  filter {
    name   = "tag:Name"
    values = ["tokyo-subnets-0"] # insert value here
  }  
}

/*data "aws_db_subnet_group" "database" {
  name = "tf-database-subnet-group"
}*/

data "aws_availability_zones" "available" {
  state = "available"
}

data "security_group" "tokyo_sg" {
  state = "available"
}