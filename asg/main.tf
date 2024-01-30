module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  name = "app-group"

  min_size                  = 0
  max_size                  = 20
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  vpc_zone_identifier       = module.vpc.public_subnets
  key_name                  = var.default_key_pair
  enable_monitoring         = true
  image_id                  = var.ami
  instance_type             = var.instance_type
  iam_instance_profile_arn  = module.iam.ec2_instance_profile_arn
  security_groups           = [module.sgs.app_sg_id]

  placement = {
    availability_zones = module.vpc.azs[1]
  }
}

resource "aws_autoscaling_attachment" "elb_attachment" {
  autoscaling_group_name = module.asg.autoscaling_group_id
  elb                    = module.elb.elb_id
}

module "vpc" {
    source = "../vpc"
}

module "iam" {
    source = "../iam"
}

module "sgs" {
    source = "../sgs"
}

module "elb" {
  source = "../elb"
}