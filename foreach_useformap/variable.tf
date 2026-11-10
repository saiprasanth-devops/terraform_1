variable "foreach_formap"{


    type = map
    default = {

        data={

    Name = "Terraform-Managed-Server"
        }

    }

   
}


variable "checklist"{


    type= list(string)

    default = [ "mongodb", "redis"]
}


variable "datamap"{


    type = map

    default ={

        mongodb={

            instance_type = "t3.micro"
        },
        redis = {
            instance_type = "t3.medium"


        }
    }
}