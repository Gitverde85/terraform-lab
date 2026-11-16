# This main.tf file is used to create multiple resource groups in Azure using Terraform. 
# The resource groups are created based on the values provided in the `var.group_name` variable. 
# This file contents a commented-out example of how to create resource groups using a count-based approach, but the active code uses a for_each loop to create resource groups based on the provided names.

# resource "azurerm_resource_group" "rg" {
#     count = var.group_count
#     name = "rg-count-${count.index}"
#     location = "East US"
# }

resource "azurerm_resource_group" "rg" {
  for_each = toset(var.group_name)
  name     = "rg-${each.key}"
  location = "East    US"
}