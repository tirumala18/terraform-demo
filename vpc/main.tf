provider "aws" {
    region = "us-east-1"
    access_key = "AKIA2PRCPUFGXQDHPGHG"
    secret_key = "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"
}
module "vpc_creation" {
    source = "./vpc_creation1"
    vpc_cidr = "192.168.0.0/16"
    
}
module "subnets_creation" {
    source = "./subnets"
    vpc_id = module.vpc_creation.vpc_id
    pub_cidr = "192.168.101.0/24"
    
    priv_cidr = "192.168.102.0/24"

  
}
module "igw_creation" {
    source = "./igw"
    vpc_id = module.vpc_creation.vpc_id
    
}
module "nat_creation" {
  
  source = "./nat"
  allocation_id = module.vpc_creation.allocation_id
  subnet_id = module.subnets_creation.private_subnet_id
  
}
module "routetables_creation" {
    source = "./routetables"
    vpc_id = module.vpc_creation.vpc_id
    rt1_name = "custom"
    internet_gateway_id = module.igw_creation.internet_gateway_id
    rt2_name = "main"
    nat_gateway_id = module.nat_creation.nat_gateway_id
    public_subnet_id = module.subnets_creation.public_subnet_id
    private_subnet_id = module.subnets_creation.private_subnet_id
  
}
module "ec2_creation" {
    source = "./ec2"
    instance_ami = "ami-0ed9277fb7eb570c9"
    instance_type = "t2.micro"
    subnet_id = module.subnets_creation.public_subnet_id
    
  
}
