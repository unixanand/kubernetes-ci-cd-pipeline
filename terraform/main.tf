provider "aws" {
  region = "us-east-1"
}

resource "aws_instance" "devops_server" {
  ami           = "ami-053b0d53c279acc90" # Ubuntu 22.04
  instance_type = "t2.xlarge"
  key_name      = "your-keypair"

  tags = {
    Name = "devops-project"
  }
}

resource "aws_s3_bucket" "kops_state" {
  bucket = "your-kops-state-bucket-unique"
}

output "public_ip" {
  value = aws_instance.devops_server.public_ip
}

