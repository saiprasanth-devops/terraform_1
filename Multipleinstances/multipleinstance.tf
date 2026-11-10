# Define the EC2 Instance Resource
resource "aws_instance" "multipleinstances" {

    count = length(var.instancelist)
 ami           = "ami-0055977a6e828a4f4" # Replace with a valid AMI ID for your region
  instance_type = "t3.micro"

  tags = {
    Name = "Terraform-Instance ${var.instancelist[count.index]}"
  }
}


resource "aws_security_group" "allow_tls" {
        count = length(var.instancelist)

  name        = "allow_tls ${var.instancelist[count.index]}"
  description = "Allow TLS inbound traffic and all outbound traffic"
  #vpc_id      = aws_vpc.main.id

  tags = {
    Name = "allow_tls ${var.instancelist[count.index]}"
  }
}


resource "aws_route53_record" "web" {
            count = length(var.instancelist)
  zone_id = "Z063293532TA5U290WZK9"
  name    = "${var.instancelist[count.index]}.godeploy.online"
  type    = "A"
  ttl     = 1
  records = [aws_instance.multipleinstances[count.index].private_ip]
#   aws_instance.multipleinstances[0].private_ip
#  since it is returning array just add the index
}
