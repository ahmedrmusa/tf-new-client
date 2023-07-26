variable "alb_name" {
  description = "Application Load Balancer Name"
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of existing subnet IDs in the VPC where resources will be deployed."
}

variable "security_group_ids" {
  type = list(string)
}

variable "vpc_id" {
  description = "VPC ID"
}

variable "alb_sg" {}

variable "db_sg" {}

variable "ssl_certificate_id" {}