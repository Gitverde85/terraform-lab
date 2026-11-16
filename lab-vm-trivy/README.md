# Lab 10: Static Analysis of Infrastructure as Code (IaC) with Trivy

This practical lab demonstrates how to identify security bad practices and vulnerabilities in Terraform codes (Azure) using **Trivy** before the infrastructure is provisioned.

## 🚀 How the Lab Works
The purpose of this exercise is divided into two fundamental parts:
1. **Insecure Phase:** Intentionally create a Terraform code containing severe security flaws (such as exposed passwords and completely open network rules).
2. **Scan and Fix Phase:** Use the Trivy security tool to scan the folder, interpret the generated flaws report, and apply the recommended fixes directly to the Terraform configuration files.

---

## 🛠️ Prerequisites
Before starting, make sure you have the following installed on your machine:
* **Terraform** installed (v1.12.2 or higher)
* **Trivy CLI** installed ([Installation Instructions](https://github.io))
* **Azure CLI** installed and authenticated (`az login`)

---

## 👣 Step-by-Step Execution

### Step 1: Initialize the Insecure Lab
Make sure the `main.tf`, `variables.tf`, `provider.tf`, `outputs.tf`, and `terraform.tfvars` files are created in your directory with the initial vulnerable settings.

Initialize Terraform in the directory:
```bash
terraform init
```

### Step 2: Run the First Scan with Trivy
Before generating your infrastructure plan, run the static analysis tool to capture the current code vulnerabilities:
```bash
trivy config .
```
*Trivy will scan the root module and find the misconfigurations. You can inspect the expected terminal log output in the section below.*

### Step 3: Review the Execution Plan
To see how Terraform maps these unsecured configurations into real Azure resources, run the execution plan pointing directly to your variable definitions file:
```bash
terraform plan -var-file="terraform.tfvars"
```
*Review the terminal plan output to locate `disable_password_authentication = false` and `source_address_prefix = "*"` before proceeding.*

### Step 4: Apply the Security Fixes
Modify the `main.tf` file to the secure version available in the course script. The main changes applied will be:
* Restrict the NSG rule only to the SSH port (22) and limit it to a trusted source IP.
* Disable password authentication (`disable_password_authentication = true`) and require public SSH keys (`admin_ssh_key`).

### Step 5: Validate Changes with a New Scan
After updating and saving your configuration files, run the Trivy scan again to ensure that critical alerts have been successfully mitigated to clean status:
```bash
trivy config .
```

---

## 🛡️ Vulnerabilities Mapped in this Lab
* **Permissive NSG Rule:** Allowing all inbound traffic (`*:*`), which exposes critical ports publicly.
* **Credentials Exposure:** Authentication based on static and predictable passwords written directly in plain text within the variables files.

### Expected Trivy Scan Output (Insecure Phase)
```text
Report Summary

┌─────────┬───────────┬───────────────────┐
│ Target  │   Type    │ Misconfigurations │
├─────────┼───────────┼───────────────────┤
│ .       │ terraform │         0         │
├─────────┼───────────┼───────────────────┤
│ main.tf │ terraform │         5         │
└─────────┴───────────┴───────────────────┘

main.tf (terraform)

Tests: 5 (SUCCESSES: 0, FAILURES: 5)
Failures: 5 (UNKNOWN: 0, LOW: 0, MEDIUM: 0, HIGH: 2, CRITICAL: 3)

AZU-0039 (HIGH): Linux virtual machine allows password authentication.
AZU-0047 (CRITICAL): Security group rule allows unrestricted ingress from any IP address.
AZU-0048 (CRITICAL): Security group rule allows unrestricted ingress to RDP port from any IP address.
AZU-0050 (CRITICAL): Security group rule allows unrestricted ingress to SSH port from any IP address.
AZU-0074 (HIGH): Security group rule allows unrestricted ingress to sensitive ports from any IP address.
```

---

## 📊 Terraform Outputs

After a successful deployment, this project exposes the following infrastructure details:

* **vm_name:** The resource name assigned to the deployed Linux Virtual Machine.
* **nsg_name:** The name of the Network Security Group containing the firewall rules.

### Code Block Reference
```hcl
output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}

output "nsg_name" {
  value = azurerm_network_security_group.nsg.name
}
```
