variable "ami_id" {
    type = string
    description = "passing ami value to main.tf"
    default = ""
}
variable "instance_type" {
    type = string
    default = ""
}