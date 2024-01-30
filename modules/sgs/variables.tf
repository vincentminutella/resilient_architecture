variable "my_ip" {
    type = string
    description = "test whitelisted local ip"
    default = "107.185.51.94/32"
}

variable "vpc_id" {
    type = string
    description = "id of the hosting vpc"
}