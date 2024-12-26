provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

terraform {
  backend "s3" {
    bucket         = "aws-iac-tf-19159"  # Added missing closing quotation mark
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    dynamodb_table = "dynamodb-state-locking"
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99"  # Replace with your desired AMI ID
  instance_type = "t2.micro"
}

output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
