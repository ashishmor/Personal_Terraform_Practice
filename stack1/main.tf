terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
  # backend "s3" {
  #   bucket         = "tfstate-storage-myproject"  # Replace with your chosen bucket name
  #   key            = "stack1/terraform.tfstate"            # The state file name
  #   region         = "us-east-1"                    # Replace with your desired AWS region
  #   encrypt        = true                            # Optional: Enable encryption
  # }
  } 
# Configure the AWS Provider
provider "aws" {
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

resource "aws_s3_bucket_versioning" "terraform_backend" {
  bucket = "tfstate-storage-myproject"  # Replace with your desired bucket name
                  
versioning {
  enabled = true
}
}

resource "aws_instance" "NewDemo2" {
  ami           = "ami-0aa7d40eeae50c9a9"
  instance_type = "t2.micro"
}