data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}

# data "caller_arn" {
#   value = data.aws_caller_identity.current.arn
# }

# data "caller_user" {
#   value = data.aws_caller_identity.current.user_id
# }

resource "aws_db_instance" "default" {
  allocated_storage    = 20
  storage_type         = "gp2"
  engine               = "postgres"
  engine_version       = "10.14"
  instance_class       = "db.t2.micro"
  name                 = var.db_name
  username             = var.db_user
  # password             = aws_ssm_parameter.database_password_parameter.arn
  password             = random_password.database_password.result
  # parameter_group_name = "default.postgres9.6"
  skip_final_snapshot  = true
  backup_retention_period = 0
  apply_immediately    = true
  publicly_accessible  = true  # enable public access
  vpc_security_group_ids    = [aws_security_group.rds.id]
  db_subnet_group_name = aws_db_subnet_group.default.name
}
