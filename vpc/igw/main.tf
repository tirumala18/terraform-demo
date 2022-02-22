resource "aws_internet_gateway" "igw" {
    vpc_id = var.vpc_id
    tags = {
        name = "igw"
    }
  
}
output "internet_gateway_id" {
    value = aws_internet_gateway.igw.id
}