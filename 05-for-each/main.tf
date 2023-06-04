module "random_strs" {
    source = "./modules/strs"
    str_len_map = var.str_len_map
}

variable "str_len_map" {
    type = map(number)
    default = {
      "len-1" = 10
      "len-2" = 20
      "len-3" = 30
      "len-4" = 40
      "len-5" = 50
      "len-6" = 60
      "len-7" = 70
    }
}

output "strings" {
	value = module.random_pwds.passwords
}
