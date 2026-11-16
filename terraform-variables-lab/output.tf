output "endpoint_storage_account" {
  value = azurerm_storage_account.storage.primary_blob_endpoint
}