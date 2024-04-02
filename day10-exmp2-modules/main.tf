module "ec2_instance" {
    source = "terraform-aws-modules/ec2-instance/aws"
    name = "single-instance"
    instance_type = "t2.micro"
    key_name = "new-kp"
    monitoring = true
    tags = {
        terraform ="true"
        environment = "dev"
    }
  
}