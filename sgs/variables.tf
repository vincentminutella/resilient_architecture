variable "app_sg_ingress_https" {
    type = string
    description = "default ingress rule for the application instances"
    default = "sg-application-ingress-https"
}

variable "app_sg_ingress_http" {
    type = string
    description = "default ingress rule for the application instances"
    default = "sg-application-ingress-http"
}

variable "app_sg_egress_https" {
    type = string
    description = "default egress rule for the application instances"
    default = "sg-application-egress-https"
}

variable "app_sg_egress_http" {
    type = string
    description = "default egress rule for the application instances"
    default = "sg-application-egress-http"
}

variable "db_sg_ingress" {
    type = string
    description = "default ingress rule for rds instances"
    default = "sg-db-ingress"
}

variable "db_sg_egress" {
    type = string
    description = "default egress rule for rds instances"
    default = "sg-db-egress"
}
