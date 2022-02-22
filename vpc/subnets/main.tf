resource "aws_subnet" "public" {
    vpc_id = var.vpc_id
    cidr_block = var.pub_cidr
    tags = {
        name = "public_subnet"
    }
  
}
resource "aws_subnet" "private" {
    vpc_id = var.vpc_id
    cidr_block = var.priv_cidr
    tags = {
      "name" = "private_subnet"
    }
  
}
output "public_subnet_id" {
    value = aws_subnet.public.id
  
}
output "private_subnet_id" {
    value = aws_subnet.private.id
  
}