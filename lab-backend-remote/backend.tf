terraform {
  backend "azurerm" {
    resource_group_name  = "rg-lab-terraform-backend"
    storage_account_name = "labtfstatestorageaccount"
    container_name       = "tfstate"
    key                  = "lab/terraform.tfstate"

  }
}