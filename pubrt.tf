resource "aws_route_table" "pubroutegap" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_internet_gateway.gapigw
  ]

  vpc_id = aws_vpc.gapvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.gapigw.id
  }

  tags = {
    Name = "pubroutegap"
  }
}
