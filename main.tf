provider "aws" {
    region = "us-west-1"
} 

module "vpc" {
    source = ".//modules/vpc"
}

module "asg" {
    source = ".//modules/asg"
    vpc_zone_identifier = module.vpc.public_subnets
    security_groups = module.sgs.app_sg_id
    elb = module.elb.elb_id
}

module "elb" {
    source = ".//modules/elb"
    subnets = module.vpc.private_subnets
    availability_zones = module.vpc.azs
}

module "sgs" {
    source = ".//modules/sgs"
    vpc_id = module.vpc.vpc_id
}
