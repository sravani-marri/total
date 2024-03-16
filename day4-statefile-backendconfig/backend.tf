terraform {
    backend "s3" {
        bucket = "manvitatulasireddy"
        key = "terraform-configure"
        region = "us-east-1"
        dynamodb_table = "terraform-state-lock-dynamo"
        encrypt = true
      
    }
}