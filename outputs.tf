# #modules/network-layer/variables.tf
# # VPC
# output "ec2_id_test" {
#   value = module.ec2.ec2_id_test
# }

# # Subnet
# output "ec2_public_ip" {
#   value = module.ec2.ec2_public_ip
# }

# output "ec2_private_ip" {
#   value = module.ec2.ec2_private_ip
# }



#modules/network-layer/variables.tf
# VPC
output "vpc_id_test" {
  value = module.network.vpc_id_test
}

# Subnet
output "subnet_id_test" {
  value = module.network.subnet_id_test
}

output "aws_database_password_parameter_arn" {
  value = module.db.aws_database_password_parameter_arn
}
output "my_ssm" {
  value = module.db.my_ssm
}
output "my_ssm_arn" {
  value = module.db.my_ssm_arn
}

output "aws_current_user" {
  value = module.db.aws_current_user
}


output "db_parameters_key_arn" {
  value = module.db.parameters_key_arn
}
output "db_db_password_arn" {
  value = module.db.db_password_arn
}

output "ec2_public_ip" {
  value = module.ec2.ec2_public_ip
}

