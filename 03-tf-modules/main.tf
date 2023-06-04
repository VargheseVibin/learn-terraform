module "ec2_instance" {
    source = "./modules/aws_instance"
    ami = var.AMIS["ap-south-1"]
    instance_type = "t2.micro"
}

module "random_str" {
    source = "./modules/ramdom_str"
    length = 14
}

module "random_pwd" {
    source = "./modules/random_pwd"
    pwd_len_list = var.pwd_lengths
}

variable "pwd_lengths" {
    type = list(number)
    default = [ 10, 15, 20, 30 ]
}