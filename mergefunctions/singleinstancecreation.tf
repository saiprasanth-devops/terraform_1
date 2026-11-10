resource "aws_instance" "my_server" {
  ami           = "ami-0055977a6e828a4f4" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"
    vpc_security_group_ids = [aws_security_group.allow_tls.id]


  tags = merge(var.maplist,
  {
env = "dev"
terraform = "true"

  })
}

resource "aws_security_group" "allow_tls" {
  name        = "allow_tls"
  description = "Allow TLS inbound traffic and all outbound traffic"
  # vpc_id      = aws_vpc.main.id

   egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }
   ingress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
   # ipv6_cidr_blocks = ["::/0"]
  }

  tags = merge({
    Name = "allow_tls"
  },
  {
    env = "dev"
  }
  )
}


# resource "aws_route53_record" "web" {
#   zone_id = "Z063293532TA5U290WZK9"
#   name    = "terraform.godeploy.online"
#   type    = "A"
#   ttl     = 1
#   records = [aws_instance.my_server.public_ip]
# }


