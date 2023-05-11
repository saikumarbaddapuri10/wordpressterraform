resource "aws_subnet" "pvtsubgap" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap
  ]
  vpc_id = aws_vpc.gapvpc.id
  cidr_block = "192.168.1.0/24"
  availability_zone = "ap-south-1b"

  tags = {
    Name = "pvtsubgap"
  }
}
