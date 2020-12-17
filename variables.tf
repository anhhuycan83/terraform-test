#modules/user-layer/variables.tf
variable "env" {
  type    = string
  default = "test"
}
variable "region" {
  type    = string
  default = "ap-southeast-1"
}
variable "subnet_cidrs" {
  type    = list(any)
  default = ["10.10.1.0/24"]
}
variable "vpc_cidr" {
  type    = string
  default = "10.10.0.0/16"
}
variable "instance_type" {
  type    = string
  default = "t2.micro"
}
variable "volume_size" {
  type    = number
  default = "10"
}

variable "shared_credentials_file" {
  type = string
  # default = "c:/cygwin64/home/phamquochuy/.aws/credentials"
  default = "/cygdrive/d/huy/onedrive/Doc/admin_accessKeys.csv"
}

# Variable for db
variable "db_name" {
  type    = string
  default = "postgres"
}
variable "db_user" {
  type    = string
  default = "sa"
}
variable "db_password" {
  type    = string
  default = "sa"
}

variable "db_instance_type" {
  type    = string
  default = "db.t2.micro"
}

variable "db_volume_size" {
  type    = number
  default = 20
}
