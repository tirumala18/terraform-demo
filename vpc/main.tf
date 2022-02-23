provider "aws" {
    region = "us-east-1"
    access_key = "AKIA4YF22HNM23BL5TZH"
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
 subnet_id_public = module.subnets.pub_id
 subnet_id_private = module.subnets.priv_id
 rt1_name = "rt1"
 rt2_name = "rt2"
}
module "ec2creation" {
 source = "./ec2"
 subnet_id = module.subnets.pub_id
 instance_ami = "ami-033b95fb8079dc481"
 instance_type = "t2.micro"
 instance_name = "ec2"
     }

