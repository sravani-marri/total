# create custiom vpc
resource "aws_vpc" "test" {
    cidr_block = "10.0.0.0/16"
    tags = {
      Name ="test"
    }
}
# creation aws internet gateway
resource "aws_internet_gateway" "intg" {
    vpc_id = aws_vpc.test.id
    tags = {
      Name ="test"
    }
}
#create aws subnet
resource "aws_subnet" "public" {
    vpc_id = aws_vpc.test.id
    cidr_block = "10.0.0.0/24"
    tags = {
      Name = "piblic"
    }
}
#caerte routetable &attach internetgateway,rt
resource "aws_route_table" "rt1" {
    vpc_id = aws_vpc.test.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.intg.id
    }
}
#create subnete association
resource "aws_route_table_association" "rt1" {
    route_table_id = aws_route_table.rt1.id
    subnet_id = aws_subnet.public.id
}
# create private subnet
resource "aws_subnet" "private" {
    vpc_id = aws_vpc.test.id
    cidr_block = "10.0.1.0/24"
    tags = {
      Name = "private"
    }
}
# create eip
resource "aws_eip" "elasticip" {
    tags = {
      Name = "eip"
    }
}
#create nategateway [select public subnet wile doing]
resource "aws_nat_gateway" "natgateway" {
    subnet_id = aws_subnet.public.id
    allocation_id = aws_eip.elasticip.id
    tags = {
      Name = "natgateway"
    }
}
# create routetable and attach to natgateway & private subnet
resource "aws_route_table" "prv-rt" {
    vpc_id = aws_vpc.test.id
    route  {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_nat_gateway.natgateway.id
    }
    tags = {
      Name = "prv-rt"
    }
}
# attach privateroute to private subnet
resource "aws_route_table_association" "prv-rt" {
    route_table_id = aws_route_table.prv-rt.id
    subnet_id = aws_subnet.private.id
  
}
# create security groups
resource "aws_security_group" "sg" {
    name = "allow_tls"
    vpc_id = aws_vpc.test.id
tags = {
    Name = "sg"
}
    ingress  {
        description = "TLS from vpc"
        from_port   = 80
        to_port     = 80
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    ingress {
        description = "TLS form vpc"
        from_port   = 22
        to_port     = 22
        protocol    = "tcp"
        cidr_blocks = ["0.0.0.0/0"]
    }
    egress {
        from_port   = 0
        to_port     = 0
        protocol    = "-1"
        cidr_blocks   =["0.0.0.0/0"]
    }
}