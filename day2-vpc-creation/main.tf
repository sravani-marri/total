#create vpc
resource "aws_vpc" "my-vpc" {
    cidr_block = "10.0.0.0/16"
    tags = {
        Name ="my-vpc"
    }
  
}

#create internet gayeway and attach to vpc
resource "aws_internet_gateway" "my-vpc" {
    vpc_id = aws_vpc.my-vpc.id
  
}

#create subnet
resource "aws_subnet" "my-vpc" {
    cidr_block = "10.0.0.0/24"
    vpc_id = aws_vpc.my-vpc.id

}

#edit rout table&attach internergateway
resource "aws_route_table" "my-vpc" {
    vpc_id = aws_vpc.my-vpc.id
    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = aws_internet_gateway.my-vpc.id 

    }
    
}

#subnet association
resource "aws_route_table_association" "my-vpc" {
    route_table_id = aws_route_table.my-vpc.id
    subnet_id = aws_subnet.my-vpc.id


    
}