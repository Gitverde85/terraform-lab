variable "location" {
  default = "eastus"
}

variable "admin_username" {
  default = "adminuser"
}

variable "admin_password" {
  default = "P@ssw0rd123"  # Bad Practice. Use a secure method to manage secrets.
}