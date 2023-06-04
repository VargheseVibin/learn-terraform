resource "random_string" "rand_strs" {
  for_each = var.str_len_map
  length   = each.value
  special  = false
}

variable "str_len_map" {}

output "strings" {
  value = [for str in random_string.rand_strs : str.result]
}
