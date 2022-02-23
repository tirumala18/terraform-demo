provider "aws" {
    region = "us-east-1"
    access_key = "AKIA2PRCPUFGXQDHPGHG"
    secret_key = "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"
}
module "vpc" {
  source  = "./VPC"
  vpc_cidr = "192.168.0.0/16"
  vpc_name = "ex-vpc"
  eip_name = "ex-eip"
}
module "subnets" {
  source  = "./subnet"
  vpc_id = module.vpc.vpc_id
  subnet_cidr = "192.168.1.0/24"
  subnet_cidr_priv = "192.168.2.0/24"
}
module "IGW"{
  source = "./igw"
  vpc_id = module.vpc.vpc_id
  name="ex-igw"
}
module "NAT"{
  source = "./nat"
  allocation_id = module.vpc.allocation_id
  subnet_id = module.subnets.priv_id
  name="ex-nat"
}
module "route_table" {
 source = "./routetable" 
 vpc_id = module.vpc.vpc_id
 igw_id = module.IGW.igw_id
 nat_id = module.NAT.nat_id
 subnet_id_public = module.subnets.pub_id
 subnet_id_private = module.subnets.priv_id
 rt1_name = "rt1"
 rt2_name = "rt2"
}
