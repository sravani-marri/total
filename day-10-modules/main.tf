module "dev" {
    source = "../day-9-modules"
    ami_id = "ami-033a1ebf088e56e81"
    instance_type = "t2.micro"
    key_name = "priject"
}