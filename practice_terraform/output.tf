# output "checktheoutputofinstance"{


#   value  ={
#     instancename = aws_instance.my_server.tags.Name
#     public_ip = aws_instance.my_server.public_ip
#     private_ip = aws_instance.my_server.private_ip
#     securitygroups=aws_instance.my_server.security_groups


#   }
  
# }



# output "multipleinstanceschecks"{

#     value = {


#         instancename = aws_instance.multipleinstances.tags.Name
#          public_ip = aws_instance.multipleinstances.public_ip
#         private_ip = aws_instance.multipleinstances.private_ip
#     }
# }

