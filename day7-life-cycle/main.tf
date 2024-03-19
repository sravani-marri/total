resource "aws_instance" "project2" {
    ami = "ami-02d7fd1c2af6eead0"
    instance_type = "t2.micro"
    key_name = "new-kp"
    subnet_id = "subnet-02c3ff7546f3582f0"
    
    tags = {
      Name ="project2"
    }
}    
 #below examples are for lifecycle meta_arguments
 # lifecycle {
 # create_before_destroy = true }

# lifecycle {
 # ignore_changes = [tags,] }

 
# lifecycle
#prevent_destory = true


