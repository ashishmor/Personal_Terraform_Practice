terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  backend "s3" {
    bucket         = "tfstate-storage-myproject"  # Replace with your chosen bucket name
    key            = "ecs/terraform.tfstate"            # The state file name
    region         = "us-east-1"                    # Replace with your desired AWS region
    encrypt        = true                            # Optional: Enable encryption 
    
  } 
}

# Configure the AWS Provider
provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "DemoStack2" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
}