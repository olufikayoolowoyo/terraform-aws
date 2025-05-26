# Output the ALB DNS name
output "alb_dns_name" {
  value = aws_lb.this.dns_name
}
