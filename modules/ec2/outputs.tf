#modules/network-layer/variables.tf
# VPC
output "ec2_id_test" {
  value = aws_instance.ec2_test.id
}

# Subnet
output "ec2_public_ip" {
  value = aws_instance.ec2_test.public_ip
}

output "ec2_private_ip" {
  value = aws_instance.ec2_test.private_ip
}

output "instance_profile_name" {
  value = aws_iam_instance_profile.get_parameters.name
}

output "ec2_aws_iam_role_arn" {
  value = aws_iam_role.get_parameters.arn
}
