resource "aws_route_table" "NATGatewayRT" {
  depends_on = [
    aws_nat_gateway.NATGATEWAY
  ]

  vpc_id = aws_vpc.gapvpc.id

  route {
    cidr_block = "0.0.0.0/0"
    nat_gateway_id = aws_nat_gateway.NATGATEWAY.id
  }

  tags = {
    Name = "RouteTable4NATGateway"
  }

}
