/*
provider "aws" {
  region = var.AWS_REGION
  version = "~> 2.31.0"
}

data "aws_security_group" "default" {
  name   = "default"
  vpc_id = module.vpc-rodmed.vpc_id
  tags = {
    Name        = "SG-Default-rodmed-jenkins"
    Environment = "dev"
  }
}
module "vpc-rodmed" {
  source = "terraform-aws-modules/vpc/aws"
  version = "2.17.0"

  name = "VPC-rodmed-jenkins"
  cidr = "10.0.0.0/16"

  azs             = ["us-east-2a", "us-east-2b"]
  private_subnets = ["10.0.1.0/24", "10.0.2.0/24"]
  public_subnets  = ["10.0.101.0/24", "10.0.102.0/24"]

  enable_nat_gateway = true
  enable_vpn_gateway = true

  tags = {
    Terraform   = "true"
    Environment = "dev"
  }
}

output "vpc_id" {
  description = "The ID of the VPC"
  value       = module.vpc-rodmed.vpc_id
}

output "private_subnets" {
  description = "List of IDs of private subnets"
  value       = module.vpc-rodmed.private_subnets
}

output "public_subnets" {
  description = "List of IDs of public subnets"
  value       = module.vpc-rodmed.public_subnets
}
*/
