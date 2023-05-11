resource "aws_instance" "MySQL" {
  depends_on = [
  aws_instance.boatwebserver,
  ]

  ami = "ami-022d03f649d12a49d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pvtsubgap.id
  key_name = "TF_key"
  vpc_security_group_ids = [aws_security_group.SQLDB.id, aws_security_group.back_sg.id]
  tags = {
    Name = "MySQLInstance"
  }
}
