output "vpc_endpoint_service_id" {
  value = aws_vpc_endpoint_service.service.id
  description = "VPC Endpoint Service ID"
}