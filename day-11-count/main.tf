resource "aws_instance" "test" {
    ami = "ami-033a1ebf088e56e81"
    instance_type = "t2.micro"
    count = 2
    tags = {
        Name ="dev.${count.index}"
    }
  
}