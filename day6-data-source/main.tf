
resource "aws_instance" "project2" {
    ami = data.aws_ami.amzlinux.id
    instance_type = "t2.micro"
    subnet_id = data.aws_subnet.my-vpc.id
    security_groups = [data.aws_security_group.my-vpc.id]
    tags = {
        Name = "test_ec2"
    }
}