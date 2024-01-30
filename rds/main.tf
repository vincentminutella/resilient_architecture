module "db" {
  source = "terraform-aws-modules/rds/aws"

  identifier = "app-db"

  engine                  = "mysql"
  major_engine_version    = "5.7"
  instance_class          = "db.t3a.micro"
  allocated_storage = 1
  db_name  = "app-db"
  username = "user"
  port     = "3306"
  family   = "mysql5.7"

  iam_database_authentication_enabled = true
  vpc_security_group_ids = [module.sgs.db_sg_id]
  subnet_ids             = module.vpc.private_subnets
  deletion_protection = true
}

module "vpc" {
    source = "../vpc"
}

module "sgs" {
    source = "../sgs"
}