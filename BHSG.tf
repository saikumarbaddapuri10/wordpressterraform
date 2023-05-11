resource "aws_security_group" "BHSG" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap,
    aws_subnet.pvtsubgap
  ]

  name = "bastionhostsg"
  vpc_id = aws_vpc.gapvpc.id


  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}
