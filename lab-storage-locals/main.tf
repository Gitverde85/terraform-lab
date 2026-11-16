locals {
  resource_prefix = "app-${var.environment}"
  rg_name         = "${local.resource_prefix}-rg"
  sa_name         = "st${var.environment}${substr(md5(local.resource_prefix), 0, 4)}"
}

resource "azurerm_resource_group" "rg" {
  name     = local.rg_name
  location = var.location
}

resource "azurerm_storage_account" "storage" {
  name                     = local.sa_name
  resource_group_name      = azurerm_resource_group.rg.name
  location                 = var.location
  account_tier             = "Standard"
  account_replication_type = "LRS"
}