variable "data"{


    type = string
    default = "hello"
}


variable "mapdata"{


    type = map

    default = {

        name = "data"



    }
}


output "instance_public_ip" {
  description = "The public IP address of the EC2 instance"
  value       = aws_instance.web.public_ip
}