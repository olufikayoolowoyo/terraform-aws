# Application Load Balancer resource
resource "aws_lb" "this" {
  name               = "${var.env}-alb"
  internal           = false
  load_balancer_type = "application"
  subnets            = var.public_subnet_ids
  security_groups    = [var.sg_alb_id]

  tags = var.tags
}

# Target Group for the ALB
resource "aws_lb_target_group" "this" {
  name     = "${var.env}-tg"
  port     = 80
  protocol = "HTTP"
  vpc_id   = var.vpc_id

  health_check {
    path                = "/"
    interval            = 30
    timeout             = 5
    healthy_threshold   = 2
    unhealthy_threshold = 2
  }

  tags = var.tags
}

# HTTP Listener for the ALB
resource "aws_lb_listener" "http" {
  load_balancer_arn = aws_lb.this.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.this.arn
  }
}

# Output the ALB DNS name
output "alb_dns_name" {
  value = aws_lb.this.dns_name
}
