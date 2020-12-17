### Create Subnet + Route Table
## Subnet
# subnet 1: db, subnet 2: ec2
resource "aws_subnet" "subnet_test" {
  count                   = "2"
  availability_zone       = data.aws_availability_zones.available.names[count.index]
  vpc_id                  = aws_vpc.vpc_test.id
  cidr_block              = var.subnet_cidrs[count.index]
  map_public_ip_on_launch = true

  tags = {
    Name  = "subnet-${count.index + 1}-${var.env}"
    Stage = var.env
  }
}

## Route table
### INTERNET GATEWAY for subnet (at vpc)
resource "aws_internet_gateway" "internet_gateway_test" {
  vpc_id = aws_vpc.vpc_test.id
  tags = {
    Name  = "internet-gateway-${var.env}"
    Stage = var.env
  }
}

#main route table at vpc
resource "aws_route_table" "route_test" {
  vpc_id = aws_vpc.vpc_test.id
  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.internet_gateway_test.id
  }

  tags = {
    Name  = "route-${var.env}"
    Stage = var.env
  }
}

#sub route table at subnet (EC2)
resource "aws_route_table_association" "public" {
  count          = length(aws_subnet.subnet_test)
  subnet_id      = aws_subnet.subnet_test.*.id[count.index]
  route_table_id = aws_route_table.route_test.id
}
