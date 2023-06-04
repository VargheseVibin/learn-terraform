module "random_pwds" {
    source = "./modules/pwds"
    pwd_lengths = var.pwd_len_list
}

variable "pwd_len_list" {
    type = list(number)
    default = [ 60, 40, 20, 10, 50, 60 ]
}

output "passwords" {
	value = module.random_pwds.passwords
	sensitive = true
}
