resource "random_string" "s3_id" {
    length = 8
    min_numeric = 8
    numeric = true
}

resource "aws_s3_bucket" "access" {
    bucket = "alb-access-log-${random_string.s3_id.result}"
}