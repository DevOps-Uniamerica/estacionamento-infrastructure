variable "project" {
  type = string
  description = "Nome do projeto"
}

variable "gcp_user" {
  type = string
  description = "Usuário SSH"
}

variable "ssh_key_pub" {
  type = string
  description = "Chave pública SSH"
}
