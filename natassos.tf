resource "aws_route_table_association" "NatGatewayRTAssociation" {
  depends_on = [
    aws_route_table.NATGatewayRT
  ]

  subnet_id     = aws_subnet.pvtsubgap.id

  route_table_id = aws_route_table.NATGatewayRT.id
}
