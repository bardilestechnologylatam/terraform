variable "ami_ids" {
  description = "Mapa de ID de AMI por descripción"
  type        = map(string)
  default = {
    "amazon_linux" = "ami-0ccabb5f82d4c9af5",
    "ubuntu" = "ami-0123456789abcdef0",
    "centos" = "ami-abcdef0123456789",
  }
}

