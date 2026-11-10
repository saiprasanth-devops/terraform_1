# resource "aws_instance" "my_server" {
#   ami           = "ami-0055977a6e828a4f4" # Replace with a valid AMI ID for your region
#   instance_type = "t3.micro"
#     vpc_security_group_ids = [aws_security_group.allow_tls.id]


#   tags = var.foreach_formap
  
# }

resource "aws_security_group" "allow_tls" {
#count = length(var.checklist)
   for_each = var.datamap
  name        = each.key == "mongodb" ? each.value.instance_type : "falsevalue"   #which cant be changed
  description = "Allow TLS inbound traffic and all outbound traffic"
  # vpc_id      = aws_vpc.main.id


  tags = {
    Name = "allow_tls"   #which can be changed
  }
}


# # resource "aws_route53_record" "web" {
# #   zone_id = "Z063293532TA5U290WZK9"
# #   name    = "terraform.godeploy.online"
# #   type    = "A"
# #   ttl     = 1
# #   records = [aws_instance.my_server.public_ip]
# # }



