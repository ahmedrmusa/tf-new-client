output "ec2" {
  description = "ID of the EC2 instance"
  value       = module.ec2.instance_id
}

output "db_instance" {
  description = "Endpoint of the RDS instance"
  value       = module.rds.db_instance_id
}

output "alb_dns_name" {
  description = "DNS name of the ALB"
  value       = module.alb.alb_dns_name
}
