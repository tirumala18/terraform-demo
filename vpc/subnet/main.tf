resource "aws_subnet" "public" {
  vpc_id     = var.vpc_id

  cidr_block = var.subnet_cidr

  tags = {
    Name = "pub-sub"
  }
}

resource "aws_subnet" "private" {
  vpc_id     = var.vpc_id

  cidr_block = var.subnet_cidr_priv

  tags = {
    Name = "priv-sub"
  }
}
output "pub_id" {
    value = aws_subnet.public.id
}
output "priv_id" {
    value = aws_subnet.private.id
}