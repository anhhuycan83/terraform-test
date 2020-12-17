provider "aws" {
  region = var.region
  # shared_credentials_file = var.shared_credentials_file
  # AKIAYGU3CMHBXPNCHN6J
  # LteJ4K3a5/ltXiDj1iRtBbRlkybpmqv8Zv2NWYSL
  access_key = "AKIAYGU3CMHBXPNCHN6J"
  secret_key = "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"
}

# Template provider
provider "template" {
  # version = "~> 2.1"
}

# Random generator provider
provider "random" {
  # version = "~> 2.3"
}


#-----------network module-----------------
module "network" {
  source       = "./modules/network"
  env          = var.env
  region       = var.region
  vpc_cidr     = var.vpc_cidr
  subnet_cidrs = var.subnet_cidrs
}

#-----------ec2 module-------------
module "ec2" {
  source = "./modules/ec2"
  env    = var.env
  region = var.region

  instance_type = var.instance_type
  volume_size   = var.volume_size

  vpc_id_test           = module.network.vpc_id_test
  subnet_id_test        = module.network.subnet_id_test
  db_parameters_key_arn = module.db.parameters_key_arn
  db_password_arn       = module.db.db_password_arn
}

#-----------db module-------------
module "db" {
  source = "./modules/db"
  env    = var.env
  region = var.region

  db_instance_type = var.db_instance_type
  db_volume_size   = var.db_volume_size
  db_user          = var.db_user
  db_password      = var.db_password
  db_name          = var.db_name

  vpc_id_test    = module.network.vpc_id_test
  subnet_id_test = module.network.subnet_id_test

  ec2_aws_iam_role_arn = module.ec2.ec2_aws_iam_role_arn
  # subnet_cidrs = var.subnet_cidrs
  nw_subnet_cidrs = var.subnet_cidrs
}
