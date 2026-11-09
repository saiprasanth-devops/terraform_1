resource "aws_instance" "example" {
  ami           = "data"
  instance_type = var.condition == "dev" ? var.devinstancetype : var.devinstancetype_t2
    #vpc_security_group_ids = [aws_security_group.web_sg.id] 

  tags = {

    Name= "variables"
  }
  
#map data should be capital then only it is considering


}