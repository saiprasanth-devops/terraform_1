resource "aws_instance" "instances_creations" {
    #count = 2
    count = length(var.instanceslist)
  ami           = "ami-0055977a6e828a4f4" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_sg[count.index].id]

  tags = {
    Name = "Terraform-${var.instanceslist[count.index]}"
  }
}


# 1. Create the Security Group
resource "aws_security_group" "my_sg" {
    #count = 2
    count = length(var.instanceslist)

  name        = "allow-ssh-http-${var.instanceslist[count.index]}"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "SSH from anywhere"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"] # For production, restrict this to your IP
  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "roboshop-common-terraform-${var.instanceslist[count.index]}"
  }
}

