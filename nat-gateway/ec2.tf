resource "aws_instance" "public" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "new-kp"
    associate_public_ip_address = true
    tags = {
      Name = "public-ec2"
    }
  subnet_id = aws_subnet.public.id
  security_groups = [aws_security_group.sg.id]
  
  
}