data "aws_security_groups" "test" {
  filter {
    name   = var.securitygroupnameaddress 
    values =  [var.securitygroupname]  
  }

 
}



output "pullthedata"{

  value       = data.aws_security_groups.test


}

output "gsids"{

  value       = data.aws_security_groups.test.ids


}




variable "securitygroupnameaddress"{
    type = string
    default = "group-name"
}



data "aws_instance" "target" {
  # Look up by instance ID or tags/filters
  instance_id = "i-098398a79cc84dcaa"
}

output "attached_security_group_ids" {
  value = data.aws_instance.target.vpc_security_group_ids
}


 


resource "aws_instance" "example" {
  ami           = "ami-0055977a6e828a4f4"
  instance_type = "t2.micro"
  #   # Attach the security group ID as a list
  # vpc_security_group_ids = [aws_security_group.web_sg.id]
  #the reason why we dont give the [] is from the vpc_security_group_ids will get as []
  vpc_security_group_ids = data.aws_instance.target.vpc_security_group_ids

  tags = {
    Name = "Automation_created one"
  }
}

# resource "aws_security_group" "example" {
#   name   = "default"
#   vpc_id = "vpc-05de5cb280cf6225f"


# }





















