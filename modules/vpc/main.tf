module "vpc" {
  source = "terraform-aws-modules/vpc/aws"
  
  name = "fitness-tracker"
  cidr = var.vpc_cidr
  azs  = var.azs
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = false
}


