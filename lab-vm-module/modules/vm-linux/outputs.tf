output "public_ip" {
  description = "public ip address of the virtual machine"
  value       = azurerm_public_ip.public_ip.ip_address
}