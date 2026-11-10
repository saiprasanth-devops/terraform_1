

resource "aws_security_group" "allow_tls" {

   for_each = var.foreach_formap
  name        = each.value.Name   #which cant be changed
  description = "Allow TLS inbound traffic and all outbound traffic"
  # vpc_id      = aws_vpc.main.id

 

  tags = {
    Name = "allow_tls"   #which can be changed
  }
}





