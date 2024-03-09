module "VPC" {
  source = "./VPC"
}

module "security-group" {
  source = "./security-group"
  vpc-id = module.VPC.vpc-id
}

module "ec2" {
  source            = "./ec2"
  security-group-id = module.security-group.security-group-id
  public-subnet-id  = module.VPC.public-subnet-id
}
