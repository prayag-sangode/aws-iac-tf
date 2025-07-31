provider "aws" {
  region = "us-east-1"  # Replace with your desired AWS region
}

terraform {
  backend "s3" {
    bucket         = "tfstate-bucket19159"
    key            = "terraform.tfstate"
    region         = "us-east-1"
    encrypt        = true
    use_lockfile = true
  }
}

# Create an EC2 instance
resource "aws_instance" "example" {
  ami           = "ami-0c94855ba95c71c99" 
  instance_type = "t2.micro"
}

## Output public ip 
output "instance_public_ip" {
  value = aws_instance.example.public_ip
}
