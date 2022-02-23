resource "aws_vpc" "vpc" {
    cidr_block = var.vpc_cidr
    tags = {
        Name = var.vpc_name
    }
}
resource "aws_eip" "ip" {
    vpc = true
    tags = {
      Name = var.eip_name
  }
}
output "vpc_id" {
    value = aws_vpc.vpc.id
}
output "allocation_id" {
    value = aws_eip.ip.id
}
