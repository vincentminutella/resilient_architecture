resource "aws_security_group" "lb_sg" {
  name   = "lb-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "app_sg" {
  name   = "app-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group" "db_sg" {
  name   = "db-sg"
  vpc_id = var.vpc_id
}

resource "aws_security_group_rule" "elb_sg_ingress_https" {
    type = "ingress"
    to_port = 443
    from_port = 443
    protocol = "tcp"
    security_group_id = aws_security_group.lb_sg.id
    cidr_blocks = [var.my_ip]
}

resource "aws_security_group_rule" "elb_sg_ingress_http" {
    type = "ingress"
    to_port = 80
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.lb_sg.id
    cidr_blocks = [var.my_ip]
}

resource "aws_security_group_rule" "elb_sg_egress_https" {
    type = "egress"
    to_port = 443
    from_port = 443
    protocol = "tcp"
    security_group_id = aws_security_group.lb_sg.id
    cidr_blocks = [var.my_ip]
}

resource "aws_security_group_rule" "elb_sg_egress_http" {
    type = "egress"
    to_port = 80
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.lb_sg.id
    cidr_blocks = [var.my_ip]
}

resource "aws_security_group_rule" "app_sg_ingress_https" {
    type = "ingress"
    to_port = 443
    from_port = 443
    protocol = "tcp"
    security_group_id = aws_security_group.app_sg.id
    source_security_group_id = aws_security_group.lb_sg.id
}

resource "aws_security_group_rule" "app_sg_ingress_http" {
    type = "ingress"
    to_port = 80
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.app_sg.id
    source_security_group_id = aws_security_group.lb_sg.id
}

resource "aws_security_group_rule" "app_sg_egress_https" {
    type = "egress"
    to_port = 443
    from_port = 443
    protocol = "tcp"
    security_group_id = aws_security_group.app_sg.id
    source_security_group_id = aws_security_group.lb_sg.id
}

resource "aws_security_group_rule" "app_sg_egress_http" {
    type = "egress"
    to_port = 80
    from_port = 80
    protocol = "tcp"
    security_group_id = aws_security_group.app_sg.id
    source_security_group_id = aws_security_group.lb_sg.id
}

resource "aws_security_group_rule" "db_sg_ingress" {
    type = "ingress"
    to_port = 3306
    from_port = 3306
    protocol = "tcp"
    security_group_id = aws_security_group.db_sg.id
    source_security_group_id = aws_security_group.app_sg.id
}

resource "aws_security_group_rule" "db_sg_egress" {
    type = "egress"
    to_port = 3306
    from_port = 3306
    protocol = "tcp"
    security_group_id = aws_security_group.db_sg.id
    source_security_group_id = aws_security_group.app_sg.id
}