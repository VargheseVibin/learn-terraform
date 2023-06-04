resource "random_string" "rand_strs" {
    for_each = var.str_lengths_map
    length = each.value
}

variable "str_lengths_map" {}

output "strings" {
	value = random_string.rand_strs[*].result
}
