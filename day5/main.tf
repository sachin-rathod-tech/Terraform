module "vpc" {
  source            = "./modules/vpc"
  vpc_cidr_block    = "198.168.0.0/16"
  subnet_cidr_block = "198.168.0.0/20"
  az                = "ap-northeast-2c"
  public_ip         = "true"
}

module "ec2" {
  source            = "./modules/ec2"
  ami_id            = "ami-0a7ccd97b67c60c29"
  ins_type          = "t3.micro"
  key_pair          = "seoul-key"
  subnet_id         = module.vpc.subnet_id
  security_group_id = module.vpc.aws_security_group
}
  