resource "aws_db_instance" "db" {
  allocated_storage    = var.allocated_storage
  engine               = "sqlserver-ex"
  engine_version       = "14.00.3223.3.v1"
  instance_class       = var.instance_class
  username             = var.db_user
  password             = var.db_password
  publicly_accessible = false
}