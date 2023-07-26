variable "ami_id" {
  description = "Windows Server AMI to use"
  type        = string
}

variable "instance_name" {
  description = "name of ec2 instance"
}

variable "instance_type" {
  description = "ec2 instance type for Host"
  type        = string
}

variable "subnet_id" {
  description = "Input SubnetID for Client"
  type        = string
}

variable "key_name" {
  description = "Client Keys"
}

variable "user_data" {
  description = "The user data to provide when launching the EC2 Windows Instance"
  type        = string
}

variable "security_group_ids" { 
  type = list(string) 
}