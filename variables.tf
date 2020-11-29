variable "pub_key_path" {
  description = "public key path from secret.tfvars"
}

variable "ssh_port" {
  description = "ssh access port"
  default = 22
}

variable "cidr_blocks" {
  description = "cider blocks"
  type = list(string)
  default = [
    "0.0.0.0/0"
  ]
}
