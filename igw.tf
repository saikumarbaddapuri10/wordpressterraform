resource "aws_internet_gateway" "gapigw" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap,
    aws_subnet.pvtsubgap
  ]

  vpc_id = aws_vpc.gapvpc.id

  tags = {
    Name = "gapigw"
  }
}
