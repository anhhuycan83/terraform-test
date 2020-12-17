#1. SG for db
resource "aws_security_group" "rds" {
  name        = "security-group-rds-${var.env}"
  vpc_id      = var.vpc_id_test
  description = "Allow all"

  ingress {
    from_port       = 5432
    to_port         = 5432
    protocol        = "tcp"
    # cidr_blocks = ["0.0.0.0/0"]    
    cidr_blocks = [var.subnet_id_test[1].cidr_block]
    # cidr_blocks = [var.nw_subnet_cidrs[1]]
  }
  # Allow all outbound traffic.
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
  tags = {
    Name = "terraform-example-rds-security-group"
  }
}


resource "aws_db_subnet_group" "default" {
  name       = "main"
  subnet_ids = var.subnet_id_test[*].id

  tags = {
    Name = "My DB subnet group"
  }
}