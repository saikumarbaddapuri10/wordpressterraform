resource "aws_security_group" "SQLDB" {
  depends_on = [
  aws_vpc.gapvpc,
  aws_subnet.pubsubgap,
  aws_subnet.pvtsubgap,
  aws_security_group.BHSG
  ]

  name = "mysqlsgbastionhost"
  vpc_id = aws_vpc.gapvpc.id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    security_groups = [aws_security_group.BHSG.id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

}
