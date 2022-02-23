resource "aws_route_table" "rt1" {
    vpc_id = var.vpc_id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.igw_id
    }
    tags = {
        Name = var.rt1_name
    }
  
}
resource "aws_route_table" "rt2" {
    vpc_id = var.vpc_id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = var.nat_id
    }
    tags = {
        Name = var.rt2_name
    }
  
}
resource "aws_route_table_association" "as_1" {
    subnet_id = var.subnet_id_public
    route_table_id = aws_route_table.rt1.id
  
}
resource "aws_route_table_association" "as_2" {
    subnet_id = var.subnet_id_private
    route_table_id = aws_route_table.rt2.id
  
}