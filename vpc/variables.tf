variable "public_subnets" {
    type = list(string)
    description = "vpc public subnets"
    default = ["10.0.1.0/24", "10.0.2.0/24"]
}

variable "private_subnets" {
    type = list(string)
    description = "vpc private subnets"
    default = ["10.0.101.0/24", "10.0.201.0/24"]
}

variable "vpc_cidr" {
    type = string
    description = "vpc cidr range"
    default = "10.0.0.0/16"
}

variable "azs" {
    type = list(string)
    description = " vpc availability zones"
    default = ["us-west-1a", "us-west-1b"]
}

