# create application load balancer
resource "aws_lb" "application_load_balancer" {
  name                       = "${var.project_name}-${var.environment}-alb"
  internal                   = false
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.alb_security_group.id]
  subnets                    = [aws_subnet.public_subnet_az1.id, aws_subnet.public_subnet_az2.id]
  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-${var.environment}-alb"
  }
}

# create target group port 80
resource "aws_lb_target_group" "alb_target_group" {
  name        = "${var.project_name}-${var.environment}-tg"
  target_type = "ip"
  port        = 80
  protocol    = "HTTP"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200,301,302"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTP"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# create a listener on port 80 with redirect action
resource "aws_lb_listener" "alb_http_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 80
  protocol          = "HTTP"

  default_action {
    type = "redirect"

    redirect {
      port        = 443
      protocol    = "HTTPS"
      status_code = "HTTP_301"
    }
  }
}

# create a listener on port 443 with forward action
resource "aws_lb_listener" "alb_https_listener" {
  load_balancer_arn = aws_lb.application_load_balancer.arn
  port              = 443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:880616236833:certificate/f63fc8f0-5834-43cc-891e-77f469bd5e77"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group.arn
  }
}

# create internal application load balancer
resource "aws_lb" "application_load_balancer_internal" {
  name                       = "${var.project_name}-${var.environment}-internal-alb"
  internal                   = true
  load_balancer_type         = "application"
  security_groups            = [aws_security_group.internal_alb_security_group.id]
  subnets                    = [aws_subnet.private_app_subnet_az1.id, aws_subnet.private_app_subnet_az2.id]
  enable_deletion_protection = false

  tags = {
    Name = "${var.project_name}-${var.environment}-internal-alb"
  }
}

# create target group port 8443
resource "aws_lb_target_group" "alb_target_group_internal" {
  name        = "${var.project_name}-${var.environment}-internal-tg"
  target_type = "ip"
  port        = 8443
  protocol    = "HTTPS"
  vpc_id      = aws_vpc.vpc.id

  health_check {
    healthy_threshold   = 5
    interval            = 30
    matcher             = "200,301,302"
    path                = "/"
    port                = "traffic-port"
    protocol            = "HTTPS"
    timeout             = 5
    unhealthy_threshold = 2
  }
}

# create listener on port 8443
resource "aws_lb_listener" "alb_listener" {
  load_balancer_arn = aws_lb.application_load_balancer_internal.arn
  port              = 8443
  protocol          = "HTTPS"
  ssl_policy        = "ELBSecurityPolicy-2016-08"
  certificate_arn   = "arn:aws:acm:us-east-1:880616236833:certificate/f63fc8f0-5834-43cc-891e-77f469bd5e77"

  default_action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.alb_target_group_internal.arn
  }
}