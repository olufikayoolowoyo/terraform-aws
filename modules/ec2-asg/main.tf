resource "aws_launch_template" "this" {
  name_prefix   = "${var.env}-lt"
  image_id      = var.ami_id
  instance_type = var.instance_type

  user_data = base64encode(var.user_data)

  vpc_security_group_ids = [var.sg_ec2_id]

  tags = var.tags
}

resource "aws_autoscaling_group" "this" {
  desired_capacity     = var.desired_capacity
  max_size             = var.max_size
  min_size             = var.min_size
  vpc_zone_identifier  = var.private_subnet_ids
  target_group_arns    = [var.target_group_arn]
  launch_template {
    id      = aws_launch_template.this.id
    version = "$Latest"
  }

  tag {
    key                 = "Name"
    value               = "${var.env}-ec2"
    propagate_at_launch = true
  }
}
