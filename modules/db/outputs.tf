output "db_ip" {
  value = aws_db_instance.default.address
}
output "db_name" {
  value = aws_db_instance.default.name
}
output "db_username" {
  value = aws_db_instance.default.username
}
output "db_password" {
  value = aws_db_instance.default.password
}

output "aws_database_password_parameter_arn" {
  # value = aws_ssm_parameter.database_password_parameter.arn
  value = "test"
}

output "my_ssm" {
  value = data.aws_ssm_parameter.my_ssm
}

output "db_password_arn" {
  value = aws_ssm_parameter.database_password_parameter.arn
}

output "my_ssm_arn" {
  value = data.aws_ssm_parameter.my_ssm.arn
}

output "aws_current_user" {
  value = data.aws_caller_identity.current
}

output "parameters_key_arn" {
  value = aws_kms_key.this.arn
}