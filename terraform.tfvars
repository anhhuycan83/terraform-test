# general
env    = "test"
region = "ap-southeast-1"

# network
vpc_cidr     = "10.10.0.0/16"
subnet_cidrs = ["10.10.1.0/24", "10.10.2.0/24"]

# ec2
instance_type = "t2.micro"
volume_size   = "16"

shared_credentials_file = "c:/cygwin64/home/phamquochuy/.aws/credentials"

# db
db_name          = "postgres"
db_user          = "sa"
db_password      = "sa"
db_instance_type = "db.t2.micro"
db_volume_size   = 20