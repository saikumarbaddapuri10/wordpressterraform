resource "aws_instance" "boatwebserver" {
  depends_on = [
    aws_vpc.gapvpc,
    aws_subnet.pubsubgap,
    aws_subnet.pvtsubgap,
    aws_security_group.BHSG,
    aws_security_group.SQLDB
  ]

  ami = "ami-022d03f649d12a49d"
  instance_type = "t2.micro"
  subnet_id = aws_subnet.pubsubgap.id
  key_name = "TF_key"
  vpc_security_group_ids = [aws_security_group.demoter.id]
  tags = {
    Name = "TerraboatWebserver"
  }

  connection {
    type = "ssh"
    user = "ec2-user"
    private_key = file("/home/ec2-user/terraform/tfkey")
    host = aws_instance.boatwebserver.public_ip
  }
  provisioner "remote-exec" {
    inline = [
        "sudo yum update -y",
        "sudo yum install -y httpd php php-mysql mysql",
        "sudo systemctl start httpd",
        "sudo systemctl enable httpd",
        "wget https://wordpress.org/wordpress-4.8.14.tar.gz",
        "tar -xzf wordpress-4.8.14.tar.gz",
        "sudo mv wordpress/* /var/www/html/",
        "sudo chown -R apache.apache /var/www/html/",
        "sudo systemctl restart httpd"
    ]
  }
}
