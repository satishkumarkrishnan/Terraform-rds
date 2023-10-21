variable "db_name" {
    description ="RDS DB Name"
    type        = string  
    default     = "tf_tokyo_db"
}

variable "db_password" {
    description ="RDS DB Password"
    type        = string
    sensitive   = true
    default     = "rds123"
}

variable "db_port" {
    description ="RDS DB Port"
    type        = string
    sensitive   = true
    default     = "1521"
}
variable "db_subnet_group_name" {
    description = "RDS subnet group Name"
    type        = string  
    default    = "tf_rds_subnet_group_name"   
}

