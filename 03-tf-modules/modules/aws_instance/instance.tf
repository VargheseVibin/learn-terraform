resource "aws_instance" "mod-eg-vm" {
    ami = var.ami
    instance_type = var.instance_type
}

output "mod-eg-vm-name" {
  value = toset([aws_instance.mod-eg-vm.arn, aws_instance.mod-eg-vm.ami])
}

variable ami {}
variable instance_type {}
