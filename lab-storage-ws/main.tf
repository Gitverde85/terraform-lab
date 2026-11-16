# Terraform configuration for Azure Storage Account with Workspace Isolation. Workspaces allow for isolated environments, enabling separate configurations and state management for different stages or teams.
resource "azurerm_resource_group" "rg" {
  name     = "rg-${terraform.workspace}"
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = "st${terraform.workspace}acc${substr(md5(terraform.workspace), 0, 4)}"
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = azurerm_resource_group.rg.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}