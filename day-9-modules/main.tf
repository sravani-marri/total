resource "aws_instance" "project2" {
    ami = var.ami_id
    instance_type = var.instance_type
    tags = {
      Name = "project2"
    }
  
}