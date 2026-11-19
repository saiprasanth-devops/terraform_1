data "aws_ami" "app_ami" {
  most_recent = true
  owners      = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

output "ami_id" {
  value = data.aws_ami.app_ami.id
}