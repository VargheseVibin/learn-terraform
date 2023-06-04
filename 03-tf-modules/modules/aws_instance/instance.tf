resource "aws_instance" "mod-eg-vm" {
    ami = var.ami
    instance_type = var.instance_type
}

output "mod-eg-vm-name" {
  var = toset([aws_instance.mod-eg-vm.arn, aws_instance.mod-eg-vm.ami])
}

var ami {}
var instance_type {}