resource "aws_nat_gateway" "NATGATEWAY" {
  depends_on = [
    aws_eip.NatGateway
  ]

  allocation_id = aws_eip.NatGateway.id

  subnet_id = aws_subnet.pubsubgap.id
  tags = {
    Name = "NATGATEWAY"
  }
}
