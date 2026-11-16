<!-- LAB 18: Working with Terraform Modules (Azure)

📌 Overview

This project demonstrates how to organize infrastructure code modularly using Terraform on Microsoft Azure. By separating reusable components into child modules (such as Virtual Machine configurations) and consuming them within a root module, this lab highlights best practices for code reusability, maintainability, and clean project architecture.

Prerequisites: Pre-creating the Resource Group (create-rg.sh)

Before executing Terraform commands, you should run the create-rg.sh Bash script to provision the target Azure Resource Group via the Azure CLI. Pre-creating the Resource Group helps separate foundational resource provisioning from your main Terraform configuration state.

create-rg.sh execution:

chmod +x create-rg.sh
./create-rg.sh


Project Structure

lab-18-modules/
├── create-rg.sh       # Bash script to create Azure Resource Group
├── modules/
│   └── vm/            # Child Module (Reusable Virtual Machine resources)
│       ├── main.tf
│       ├── variables.tf
│       └── outputs.tf
├── main.tf            # Root Module (Calls the VM module)
├── variables.tf
├── outputs.tf
└── provider.tf        # AzureRM Provider configuration


Module Design Overview

Child Module (./modules/vm):

Encapsulates the configuration for an Azure Network Interface (NIC) and a Linux Virtual Machine (azurerm_linux_virtual_machine).

Exposes parameters via input variables (vm_name, resource_group_name, location, subnet_id, vm_size).

Exports key attributes via outputs (vm_id, private_ip).

Root Module (./main.tf):

Manages shared networking components such as Virtual Networks (azurerm_virtual_network) and Subnets (azurerm_subnet).

Instantiates the Child Module using the module block, referencing the pre-created Resource Group and local network resource outputs.

Execution Steps

Authenticate and provision the Resource Group:

az login
./create-rg.sh


Initialize and apply Terraform:

terraform init
terraform plan
terraform apply -->
