## disable because the module db done this job already.
# resource "aws_key_pair" "keypair_test" {
#   key_name   = "keypair-${var.env}"
#   public_key = file("${path.root}/modules/ec2/keyfiles/id_rsa.pub")
#   # public_key = "c:/cygwin64/home/phamquochuy/.ssh/id_rsa.pub"
# }
