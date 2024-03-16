resource "aws_instance" "project2" {
    ami = var.ami_id
    instance_type = var.instance_type
    subnet_id = aws_subnet.my-vpc.id
    tags = {
      Name ="project2"
    }
    
  
}