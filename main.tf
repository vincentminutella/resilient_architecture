provider "aws" {
    region = "us-west-1"
} 

module "vpc" {
    source = ".//vpc"
}

module "asg" {
    source = ".//asg"
}

module "rds" {
    source = ".//rds"
}

module "elb" {
    source = ".//elb"
}

module "s3" {
    source = ".//s3"
}

module "sgs" {
    source = ".//sgs"
}


