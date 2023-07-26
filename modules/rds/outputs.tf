output "db_instance_id" {
  description = "The ID of the created RDS instance"
  value       = aws_db_instance.db.id
}
