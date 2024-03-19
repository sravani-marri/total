resource "aws_instance" "test" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "new-kp"
    user_data = file ("test.sh")
    tags = {
      Name = "project"
    }
  
}