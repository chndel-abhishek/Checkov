provider "aws" {
    region = "us-east-2"
    access_key = "AKIA3Z3NFUELPERZFAF5"
    secret_key = "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"
    }

resource "aws_instance" "myec2" {

    ami = "ami-024e6efaf93d85776"
    instance_type = "t2.micro"
  
}
