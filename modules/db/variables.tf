#modules/ec2-layer/variables.tf
variable "env" {}
variable "region" {}
variable "vpc_id_test" {}
variable "subnet_id_test" {}


# Variable for db
variable "db_instance_type" {}
variable "db_volume_size" {}

variable "db_name" {}
variable "db_user" {}
variable "db_password" {}
# variable "account_id" {
#   type = string
#   default = data.aws_caller_identity.current.account_id
# }
variable "ec2_aws_iam_role_arn" {}

variable "nw_subnet_cidrs" {}
