variable "admin_username" {
  description = "The username for the admin user."
  type        = string
  default     = "azureuser"

}

variable "admin_password" {
  description = "The password for the admin user."
  type        = string
  default     = "Testing123!"
}

variable "location" {
  description = "The Azure region where the resources will be created."
  type        = string
  default     = "East US"
}

variable "resource_group_name" {
  description = "The name of the resource group."
  type        = string
  default     = "devops-automation-rg"
}