resource "aws_autoscaling_group" "app_asg" {
  name = "app-asg"

  min_size         = 1
  max_size         = 3
  desired_capacity = 1

  vpc_zone_identifier = [
    data.terraform_remote_state.vpc.outputs.private_subnet_id
  ]

 launch_template {
  id      = data.terraform_remote_state.lt.outputs.launch_template_id
  version = "$Latest"
}

  target_group_arns = [
    data.terraform_remote_state.elb.outputs.target_group_arn
  ]

  health_check_type         = "ELB"
  health_check_grace_period = 300

  tag {
    key                 = "Name"
    value               = "asg-ec2"
    propagate_at_launch = true
  }
}
