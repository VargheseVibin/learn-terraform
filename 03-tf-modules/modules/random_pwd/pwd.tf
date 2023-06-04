resource "random_password" "passwords" {
    length = var.pwd_len_list[count.index]
    count = length(var.pwd_len_list)
}

variable "pwd_len_list" {}
