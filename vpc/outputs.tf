output "vpc_id" {
    value = aws_vpc.vpc.id
}

output "public_subnets" {
    value = [aws_subnet.public_sub_1.id, aws_subnet.public_sub_2.id]
}

output "private_subnets" {
   value = [aws_subnet.private_sub_1.id, aws_subnet.private_sub_2.id]
}

output "azs" {
    value = [aws_subnet.public_sub_1.availability_zone, aws_subnet.public_sub_2.availability_zone]
}