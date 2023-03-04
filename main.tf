terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  access_key = "AKIA2M64PJXWX3J6A24J"
  secret_key = "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"
  region = "us-east-1"
}

resource "aws_instance" "Demo" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
}

resource "aws_vpc" "example" {
  cidr_block = "10.0.0.0/16"

  tags = {
    Name = "MyCustomVPC"
  }
}