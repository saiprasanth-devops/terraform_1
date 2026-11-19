resource "aws_instance" "web" {
  
  instance_type = "t3.micro"

  tags = {
    Name = "HelloWorld"
  }
}