
resource "aws_lb" "demo" {
  name = "elb-demo"
  load_balancer_type = "application"
  security_groups = [aws_security_group.elb.id]
  // subnets =[aws_subnet.public-a.id, aws_subnet.private-a.id]
  subnets = [aws_subnet.private-a.id, aws_subnet.public-a.id]
}

resource "aws_lb_target_group" "demo" {
  name     = "lb-target-group-demo"
  port     = 80
  protocol = "HTTP"
  vpc_id   = aws_vpc.demo.id
}

# resource "aws_lb_target_group_attachment" "demo" {
#   target_group_arn = aws_lb_target_group.demo.arn
#   port             = 80
#   target_id        = 
  
# }
resource "aws_autoscaling_attachment" "demo-asg-attachment" {
  autoscaling_group_name = aws_autoscaling_group.demo.id
  alb_target_group_arn   = aws_lb_target_group.demo.arn
}



resource "aws_lb_listener" "demo" {
  load_balancer_arn = aws_lb.demo.arn
  port              = "80"
  protocol          = "HTTP"
  
  default_action {
    target_group_arn = aws_lb_target_group.demo.arn
    type             = "forward"
  }
}