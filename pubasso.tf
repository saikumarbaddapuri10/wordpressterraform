resource "aws_route_table_association" "RT-IG-Association" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap,
    aws_subnet.pvtsubgap,
    aws_route_table.pubroutegap
  ]

  subnet_id     = aws_subnet.pubsubgap.id
  route_table_id = aws_route_table.pubroutegap.id
}
