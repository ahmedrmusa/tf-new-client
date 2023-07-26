variable "allocated_storage" {
  description = "The allocated storage size for RDS instance"
  type        = number
}

variable "instance_class" {
  description = "The instance type of the RDS instance"
  type        = string
}

variable "db_name" {
  description = "The DB name to create"
  type        = string
}

variable "db_user" {
  description = "Username for the master DB user"
  type        = string
}

variable "db_password" {
  description = "Password for the master DB user"
  type        = string
}

variable "security_group_ids" {
  description = "List of security groups, comma seperated "
  type = list(string)
}