# # Define the EC2 Instance Resource
# resource "aws_instance" "multipleinstances" {

#     count = length(var.instancelist)
#  ami           = "ami-0055977a6e828a4f4" # Replace with a valid AMI ID for your region
#   instance_type = "t3.micro"

#   tags = {
#     Name = "Terraform-Instance ${var.instancelist[count.index]}"
#   }
# }


# resource "aws_security_group" "allow_tls" {
#   name        = "allow_tls"
#   description = "Allow TLS inbound traffic and all outbound traffic"
#   vpc_id      = aws_vpc.main.id

#   tags = {
#     Name = "allow_tls"
#   }
# }
