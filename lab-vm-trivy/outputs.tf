output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}