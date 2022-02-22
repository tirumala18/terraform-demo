resource "aws_vpc" "example_vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        name = "vpc"
    }
  
}
resource "aws_eip" "ip" {
    vpc = true
  
}
output "vpc_id" {
    value = aws_vpc.example_vpc.id
  
}
output "allocation_id" {
    value = aws_eip.ip.id
  
}