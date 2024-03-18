resource "aws_instance" "test" {
    ami ="ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    tags ={
        Name = "test_ec2"
    }  
}
resource "aws_s3_bucket" "test" {
    bucket = "sravanireddymarri"
    depends_on = [aws_instance.test]
  
}