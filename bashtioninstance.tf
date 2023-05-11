resource "aws_instance" "BastionHost" {
  depends_on = [
    aws_instance.boatwebserver,
    aws_instance.MySQL
  ]

  ami = "ami-022d03f649d12a49d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pubsubgap.id
  key_name = "TF_key"
  vpc_security_group_ids = [aws_security_group.BHSG.id]
  tags = {
    Name = "BashtionInstance"
  }
}
