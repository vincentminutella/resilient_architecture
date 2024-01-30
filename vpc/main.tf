resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
}

resource "aws_subnet" "public_sub_1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnets[0]
    availability_zone = var.azs[0]
}

resource "aws_subnet" "public_sub_2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.public_subnets[1]
    availability_zone = var.azs[1]
}

resource "aws_subnet" "private_sub_1" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnets[0]
    availability_zone = var.azs[0]
}

resource "aws_subnet" "private_sub_2" {
    vpc_id = aws_vpc.vpc.id
    cidr_block = var.private_subnets[1]
    availability_zone = var.azs[1]
}


