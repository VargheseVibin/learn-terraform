resource "random_password" "rand_pwds" {
    count = length(var.pwd_lengths)
    length = var.pwd_lengths[count.index]
}

variable "pwd_lengths" {}

output "passwords" {
	value = random_password.rand_pwds[*].result
}
