
resource "aws_nat_gateway" "nat_gateway" {
    allocation_id = var.allocation_id
    subnet_id = var.subnet_id
    tags = {
        Name = "nat"
    }
  
}
output "nat_gateway_id" {
    value = aws_nat_gateway.nat_gateway.id
  
}