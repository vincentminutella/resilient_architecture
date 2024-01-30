variable "subnets" {
    type = list(string)
    description = "associated public subnets"
}

variable "availability_zones" {
    type = list(string)
    description = "associated azs"
}

