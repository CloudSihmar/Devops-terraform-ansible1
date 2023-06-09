terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "4.64.0"
    }
  }
}

provider "aws" {
region = "ap-south-1"
}
resource "aws_instance" "myawsserver" {
  ami = "ami-01c9a84e1b49e17af"
  instance_type = "t2.micro"
  key_name = "san"

  tags = {
    Name = "Nginx-server"
    env = "Production"
    owner = "Sandeep"
  }
  provisioner "local-exec" {
    command = "echo The servers IP address is ${self.public_ip} && echo ${self.public_ip} > /etc/ansible/env"
  }
}

