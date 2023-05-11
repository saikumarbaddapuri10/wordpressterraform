resource "aws_security_group" "demoter" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap,
    aws_subnet.pvtsubgap,
    aws_route_table.pubroutegap
  ]
description = "HTTP, PING, SSH"

  name        = "demoter"
  vpc_id      = aws_vpc.gapvpc.id

  ingress {
    description      = "TLS from VPC"
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description      = "TLS from VPC"
    from_port        = 80
    to_port          = 80
    protocol         = "tcp"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  ingress {
    description = "Ping"
    from_port   = 0
    to_port     = 0
    protocol    = "ICMP"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }
  tags = {
    Name = "demoter"
  }
}
