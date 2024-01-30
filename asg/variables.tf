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