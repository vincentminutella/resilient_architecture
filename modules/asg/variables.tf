variable "ami" {
    type = string
    description = "instance images"
    default = "ami-0ce2cb35386fc22e9"
}

variable "instance_type" {
    type = string 
    description = "instance type"
    default = "t2.medium"
}

variable "default_key_pair" {
    type = string
    description = "default ssh keys"
    default = "node-key"
}

variable "vpc_zone_identifier" {
    type = list(string)
    description = "the subnets to attach the groups to"
}

variable "security_groups" {
    type = string
    description = "the security group of the app instances"
}

variable "elb" {
    type = string 
    description = "the id of the load balancer entry point"
}