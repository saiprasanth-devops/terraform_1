variable "instancelist"{


    type = list

    default = ["test1"," test2","test3"]


    # validation{

    #     condition = contains([""],var.instancelist)
    #         error_message = "The instancelist items cannot be empty strings."

    # }
}