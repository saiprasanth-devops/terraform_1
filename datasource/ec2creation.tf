# Create the EC2 instance
resource "aws_instance" "web_server" {
  ami           = data.aws_ami.app_ami.id
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-EC2-Example"
  }
}