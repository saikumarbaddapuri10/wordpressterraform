resource "aws_db_subnet_group" "rdssubgrp" {
  name        = "tut_subgrp"
  description = "DB subnet grp"
  subnet_ids  = [aws_subnet.pubsubgap.id,aws_subnet.pvtsubgap.id]
}
resource "aws_db_instance" "example" {
  identifier              = "example-rds"
  engine                  = "mysql"
  engine_version          = "8.0"
  instance_class          = "db.t2.micro"
  allocated_storage       = 10
  storage_type            = "gp2"
  username                = "admin"
  password                = "admin123"
  db_name                 = "example_db"
  parameter_group_name    = "default.mysql8.0"
  backup_retention_period = 7
  skip_final_snapshot   = true
  db_subnet_group_name = aws_db_subnet_group.rdssubgrp.id
}
