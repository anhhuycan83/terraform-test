# data "db" "db_user_pass" {
#   value = random_password.database_password.result
# }

# use ssm to store pass
resource "aws_ssm_parameter" "database_password_parameter" {
  name        = "db_password_master"
  description = "The parameter description"
  type        = "SecureString"
  # value       = var.db_password
  # value       = data.db.db_user_pass
  value       = random_password.database_password.result
  # value       = "abc123456"
  key_id = aws_kms_key.this.id

  tags = {
    Name        = "db-${var.env}"
    Environment = var.env
    ServerType  = "db-test"
    Stage       = var.env
  }
}

data "aws_ssm_parameter" "my_ssm" {
  name = aws_ssm_parameter.database_password_parameter.name
}

# data "aws_ssm_parameter" "database_password_parameter" {
#   filter {
#     name = "Name"
#     values = ["db-${var.env}"]
#   }
# }

# create a random db pass
resource "random_password" "database_password" {
  length  = 10
  special = false
  
  # special = true
  # override_special = "@"
}

