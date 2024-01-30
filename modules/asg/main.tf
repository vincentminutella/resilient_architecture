module "asg" {
  source  = "terraform-aws-modules/autoscaling/aws"
  name = "app-group"

  min_size                  = 0
  max_size                  = 20
  desired_capacity          = 2
  wait_for_capacity_timeout = 0
  health_check_type         = "EC2"
  key_name                  = var.default_key_pair
  enable_monitoring         = true
  image_id                  = var.ami
  instance_type             = var.instance_type
  vpc_zone_identifier       = var.vpc_zone_identifier
  security_groups           = [var.security_groups]

  user_data = "${base64encode(data.template_file.bootstrap_script.rendered)}"
  
}

data "template_file" "bootstrap_script" {
  template = <<EOF
		#! /bin/bash
    sudo apt-get update
    curl -fsSL https://deb.nodesource.com/setup_21.x | sudo -E bash
		sudo apt-get install -y nodejs
    git clone https://github.com/vincentminutella/fitness_tracker.git
    cd ./fitness_tracker
    npm install
    npm run build
    npm start
	  EOF
}

resource "aws_autoscaling_attachment" "elb_attachment" {
  autoscaling_group_name = module.asg.autoscaling_group_id
  elb                    = var.elb
}
