resource "random_string" "rand_str" {
    length = var.length
}

variable "length" {}

output "rand_str" {
    value = random_string.rand_str.result
}