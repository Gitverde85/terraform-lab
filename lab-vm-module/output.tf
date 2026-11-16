output "vm_ssh_command" {
    description = "value of the SSH command to connect to the VM"
    value = "ssh ${var.admin_username}@${module.vm_linux.public_ip}"
}