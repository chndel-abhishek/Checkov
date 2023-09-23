provider "aws" {
    region = "us-east-1"
    access_key = "AKIA3Z3NFUELNPOKKZ5Y"
    secret_key = "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"
    }

resource "aws_instance" "myec2" {

    ami = "ami-053b0d53c279acc90"
    instance_type = "t2.micro"
  
}