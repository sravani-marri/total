variable "ami" {
    type = string
    default = "ami-033a1ebf088e56e81"
}
variable "sandboxes" {
    type = list(string)
    default = [ "test","prod" ]
}
variable "instance_type" {
    type = string
    default = "t2.micro"
  
}