provider "aws" {
    region = "us-east-1"
    access_key = ""
    secret_key = ""
}
module "vpc" {
  source  = ".vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_name = "ex-vpc"
  eip_name = "ex-eip"
}
module "./subnet" {
  source  = ".subnet"
  vpc_id = module.vpc.vpc_id
  subnet_cidr = "10.0.1.0/24"
  subnet_cidr_priv = "10.0.2.0/24"
}
module "igw"{
  source = "./igw"
  vpc_id = module.vpc.vpc_id
  name="ex-igw"
}
module "nat"{
  source = "./nat"
  allocation_id = module.vpc.allocation_id
  subnet_id = module.subnet.pub_id
  name="ex-nat"
}
module "route_table" {
 source = "./route_tables" 
 vpc_id = module.vpc.vpc_id
 igw_id = module.igw.igw_id
 nat_id = module.nat.nat_id
 subnet_id_public = module.subnet.public_id
 subnet_id_private = module.subnet._idprivate
 rt1_name = "rt1"
 rt2_name = "rt2"
}
