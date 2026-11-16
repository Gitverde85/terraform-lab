variable "resource_group_name" {
    description = "The name of the resource group in which to create the resources."
    type        = string
}

variable "location" {
    description = "The Azure region in which to create the resources."
    type        = string
    default     = "East US"
}

variable "storage_account_name" {
    description = "The name of the storage account to create."
    type        = string
}