resource "aws_subnet" "pubsubgap" {
  depends_on = [
    aws_vpc.gapvpc
  ]
  vpc_id = aws_vpc.gapvpc.id
  cidr_block = "192.168.0.0/24"
  availability_zone = "ap-south-1a"
  map_public_ip_on_launch = true

  tags = {
    Name = "pubsubgap"
  }
}
