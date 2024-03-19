data "aws_ami" "amzlinux" {
    most_recent = true
    owners = ["amazon"]
    filter {
      name = "name"
      values = ["amzn2-ami-hvm-*-gp2"]
    }
    filter {
      name = "root-device-type"
      values = ["ebs"]
    }
    filter {
      name = "virtualization-type"
      values = ["hvm"]
    }
    
  
}
data "aws_security_group" "my-vpc" {   
    id = "sg-0190dc0e843affc3b"

} 
data "aws_subnet" "my-vpc" {
    id = "subnet-0d989352c2f521dd5"
  
}