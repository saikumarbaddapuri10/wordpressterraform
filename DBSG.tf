resource "aws_security_group" "back_sg" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap,
    aws_subnet.pvtsubgap,
    aws_route_table.pubroutegap
  ]

  name = "mysql-sg"
  vpc_id = aws_vpc.gapvpc.id

  ingress {
    from_port   = 3306
    to_port     = 3306
    protocol    = "tcp"
    security_groups = [aws_security_group.demoter.id]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
}
