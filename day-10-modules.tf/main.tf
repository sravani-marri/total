module "dev" {
    source = "../vpc-connect-ec2"
    ami_id = "ami-033a1ebf088e56e81"
    instance_type = "t2.micro"

}