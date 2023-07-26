variable "region" {
  description = "The region where AWS operations will take place. Examples are us-east-1, us-west-2, etc."
  default     = "us-west-2"
}

variable "shared_credentials_file" {
  description = "The path to the shared credentials file. If this is not set and a profile is specified, ~/.aws/credentials will be used."
  default     = "~/.aws/credentials"
}

variable "profile" {
  description = "The profile name as set in the shared credentials file. If AWS_PROFILE is not set and profile is not specified, the default profile is used."
  default     = "default"
}

variable "client_name" {
  description = "Name of new Client"
}

variable "vpc_id" {
  description = "ID of the existing VPC where resources will be deployed."
}

variable "subnet_ids" {
  type        = list(string)
  description = "List of existing subnet IDs in the VPC where resources will be deployed."
}

variable "alb_name" {
  description = "Application Load Balancer Name"
}

variable "alb_arn" {
  description = "Network Load Balancer ARN"
}