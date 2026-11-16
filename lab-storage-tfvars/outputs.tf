output "storage_account_name" {
    value = azurerm_storage_account.storage.name
}
output "resource_group_name" {
    value = azurerm_resource_group.rg.name
}
output "location" {
    value = azurerm_resource_group.rg.location
}