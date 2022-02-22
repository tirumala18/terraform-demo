resource "aws_route_table" "rt_1" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.internet_gateway_id
    }
    tags = {
        Name = var.rt1_name
    }
}
resource "aws_route_table" "rt_2" {
    vpc_id = var.vpc_id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.nat_gateway_id
    }
    tags = {
        Name = var.rt2_name
    }
  
}
resource "aws_route_table_association" "as_1" {
  
  subnet_id = var.public_subnet_id
  route_table_id = aws_route_table.rt_1.id
}
resource "aws_route_table_association" "as_2" {
  
  subnet_id = var.private_subnet_id
  route_table_id = aws_route_table.rt_2.id
}