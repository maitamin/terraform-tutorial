terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.28.0"
    }
  }
}


provider "aws" {
  region = "us-east-1"
  profile = "maita"
}

resource "aws_instance" "example" {
  ami = "ami-05fa00d4c63e32376"
  instance_type = "t3.micro"
  tags = {
    Name = "example"
  }

  user_data = <<EOF
    #!/bin/bash
    yum install -y httpd
    systemctl start httpd.service
  EOF
}
