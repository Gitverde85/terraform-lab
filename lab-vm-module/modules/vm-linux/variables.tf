variable "resource_group_name" {
  type        = string
  description = "value of the resource group name where the VM will be created"
}

variable "admin_username" {
  type        = string
  description = "value of the admin username for the VM"
}

variable "admin_password" {
  type        = string
  sensitive   = true
  description = "value of the admin password for the VM"
}

variable "location" {
  type        = string
  description = "value of the Azure region where the resources will be created"
}

variable "vm_name" {
  type        = string
  description = "value of the VM name"
}

variable "vm_size" {
  type        = string
  description = "value of the VM size"
}

variable "vnet_name" {
  type        = string
  description = "value of the virtual network name"
}

variable "vnet_address_space" {
  type        = list(string)
  description = "value of the virtual network address space"
}

variable "subnet_name" {
  type        = string
  description = "value of the subnet name"
}

variable "subnet_prefix" {
  type        = list(string)
  description = "value of the subnet prefix"
}

variable "public_ip_name" {
  type        = string
  description = "value of the public IP name"
}

variable "nic_name" {
  type        = string
  description = "value of the network interface name"
}

variable "os_disk_name" {
  type        = string
  description = "value of the OS disk name"
}

variable "os_disk_storage_account" {
  type        = string
  description = "value of the OS disk storage account type"
}

variable "image_publisher" {
  type        = string
  description = "value of the image publisher for the VM"
}

variable "image_offer" {
  type        = string
  description = "value of the image offer for the VM"
}

variable "image_sku" {
  type = string
}

variable "image_version" {
  type = string
}

variable "nsg_name" {
  type = string
}