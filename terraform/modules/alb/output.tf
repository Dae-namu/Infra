output "alb_dns_name" {
  value       = aws_lb.this.dns_name
  description = "DNS name of the ALB"
}

output "alb_sg_id" {
  value       = aws_security_group.alb_sg.id
  description = "Security Group ID for the ALB"
}
