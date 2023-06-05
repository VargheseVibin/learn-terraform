resource "random_pet" "mypets" {
  length = 10
  count = 10
}

output "mypets" {
  value = random_pet.mypets
}