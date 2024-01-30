resource "aws_elb" "app_elb" {
    name = "app-elb"
    subnets = module.vpc.public_subnets
    availability_zones = module.vpc.azs
    
    
  access_logs {
    bucket        = module.s3.log_bucket
    interval      = 60
  }

  health_check {
    healthy_threshold   = 2
    unhealthy_threshold = 2
    timeout             = 3
    target              = "HTTP:8000/"
    interval            = 30
  }

  listener {
    instance_port     = 8000
    instance_protocol = "http"
    lb_port           = 80
    lb_protocol       = "http"
  }

  listener {
    instance_port      = 8000
    instance_protocol  = "http"
    lb_port            = 443
    lb_protocol        = "https"
    
    ## needs an ssl certificate
  }

  cross_zone_load_balancing   = false
  idle_timeout                = 400
  connection_draining         = true
  connection_draining_timeout = 400
}

module "vpc" {
    source = "../vpc"
}


module "s3" {
    source = "../s3"
}