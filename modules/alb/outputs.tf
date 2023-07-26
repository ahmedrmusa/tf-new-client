output "alb_id" {
  description = "The ID of the created ALB"
  value       = aws_alb.alb.id
}

output "alb_dns_name" {
  description = "The DNS name of the ALB"
  value       = aws_alb.alb.dns_name
}

output "listener" {
  description = "The ID of the listener"
  value       = aws_alb_listener.listener.id
}

output "alb_arn" {
  description = "ARN of the ALB"
  value       = aws_alb.alb.arn
}