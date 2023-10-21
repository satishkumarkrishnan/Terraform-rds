variable "db_name" {
    description ="RDS DB Name"
    type        = string  
}

variable "db_password" {
    description ="RDS DB Password"
    type        = string
    sensitive   = true
    default     = "rds123"
}

variable "db_subnet_group_name" {
    description = "RDS subnet group Name"
    type        = string  
    default    = "tf_rds_subnet_group_name"   
}