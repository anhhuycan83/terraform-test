data "aws_caller_identity" "current" {}

output "account_id" {
  value = data.aws_caller_identity.current.account_id
}


data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-xenial-16.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "aws_ami" "amazon-linux-2" {
 most_recent = true


 filter {
   name   = "owner-alias"
   values = ["amazon"]
 }


 filter {
   name   = "name"
   values = ["amzn2-ami-hvm*"]
 }

 owners = ["amazon"] # Canonical
}

resource "aws_instance" "ec2_test" {
  ami           = data.aws_ami.amazon-linux-2.id
  instance_type = var.instance_type
  # key_name      = aws_key_pair.keypair_test.key_name
  key_name      = "keypair-${var.env}"

  vpc_security_group_ids = [aws_security_group.ec2_sg_test.id]
  subnet_id              = var.subnet_id_test[1].id

  root_block_device {
    volume_type           = "gp2"
    volume_size           = var.volume_size
    delete_on_termination = true
  }

  credit_specification {
    cpu_credits = "standard"
  }

  tags = {
    Name        = "ec2-${var.env}"
    Environment = var.env
    ServerType  = "ec2-test"
    Stage       = var.env
  }

  # lifecycle {
  #   create_before_destroy = true
  # }

  iam_instance_profile = aws_iam_instance_profile.get_parameters.name
  associate_public_ip_address = true

  # # read the password param using keyid, than print to debug out
  # provisioner "remote-exec" {
  #   inline = [
  #     "puppet apply",
  #     "consul join ${aws_instance.web.private_ip}",
  #   ]
  # }
  # connection {
  #   # The default username for our AMI
  #   user = "ec2-user"
  #   host = "${aws_instance.ec2_test.public_ip}"
  #   # The connection will use the local SSH agent for authentication.
  # }
}

# resource "aws_eip" "saai_micro_eip_instance" {
#   vpc = true

#   instance = aws_instance.saai_micro_instance.id
#   tags = {
#     Name  = var.project}-micro-instance-${var.env}
#     Stage = var.env
#   }
# }
