resource "aws_eip" "NatGateway" {
  depends_on = [
    aws_route_table_association.RT-IG-Association
  ]
  vpc = true
}
