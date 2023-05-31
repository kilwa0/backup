resource "aws_db_instance" "default" {
  identifier           = "bbdd"
  allocated_storage    = 10
  db_name              = "mydb"
  engine               = "mysql"
  engine_version       = "5.7"
  instance_class       = "db.t3.micro"
  username             = "foo"
  password             = "foobarbaz"
  parameter_group_name = "default.mysql5.7"
  skip_final_snapshot  = true
  # snapshot_identifier  = aws_db_snapshot.test.id
}

resource "aws_db_snapshot" "test" {
  db_instance_identifier = aws_db_instance.default.identifier
  db_snapshot_identifier = "testsnapshot1234"
}

# resource "aws_db_instance" "restore" {
#   allocated_storage    = 10
#   db_name              = "mydb"
#   engine               = "mysql"
#   engine_version       = "5.7"
#   instance_class       = "db.t3.micro"
#   username             = "foo"
#   password             = "foobarbaz"
#   parameter_group_name = "default.mysql5.7"
#   skip_final_snapshot  = true
#   snapshot_identifier  = aws_db_snapshot.test.id
# }