provider "aws" {
    region = var.aws_region 
}

data "aws_availability" "available" {

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "ashish-eks-vpc"
  cidr = "${var.vpc_cidr}"

  azs             = data.aws_availability_zones.available.name
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24", "10.0.103.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform = "true"
    Environment = "dev"
  }
}
