# Lab 11: Static Analysis of Infrastructure as Code (IaC) with Checkov

This practical lab demonstrates how to use **Checkov** to scan cloud native infrastructure manifests, map architectural security rules, and handle framework exclusions.

##  How the Lab Works
The purpose of this exercise is divided into three fundamental parts:
1. **Isolated Execution:** Setting up Checkov cleanly inside a local Python Virtual Environment to keep the host environment secure.
2. **Infrastructure Scanning:** Analyzing Terraform code configurations to extract immediate compliance checks (`PASSED` or `FAILED`).
3. **Policy Overriding:** Configuring runtime arguments to exclude third-party directory noise (like the dependency binaries folder) and utilizing an ignore configuration.

---

##  Prerequisites
Before starting, make sure you have the following installed on your machine:
* **Terraform** installed (v1.12.2 or higher)
* **Python 3** and its virtual environment library (`python3-venv`)

---

##  Step-by-Step Execution

### Step 1: Initialize the Local Environment
Ensure your configurations (`main.tf`, `variables.tf`, `provider.tf`, `outputs.tf`, and `terraform.tfvars`) match the base lab settings.

Create and activate your isolated Python virtual environment:
```bash
python3 -m venv venv
source venv/bin/activate
```

### Step 2: Install the Analyzer CLI
Upgrade the package installer and deploy Checkov smoothly within your workspace boundary:
```bash
pip install --upgrade pip
pip install checkov
```

### Step 3: Execute the Security Scan (Filtering Directory Noise)
By default, Checkov scans all directories recursively. To prevent it from scanning thousands of internal third-party dependencies located inside your `venv` folder, execute the check explicitly skipping that path:
```bash
checkov -d . --skip-path venv
```

### Step 4: Handle Exclusions with Configuration Files
If a policy failure is an accepted risk for your specific testing scenario, you can bypass it permanently by creating an explicit configuration file:
```bash
touch .checkov.yaml
```

Populate the `.checkov.yaml` file to automate skipping targeted rules globally:
```yaml
skip-check:
  - CKV_AZURE_149  # Ensure Azure VM does not enable password authentication
  - CKV_AZURE_50   # Ensure Virtual Machine Extensions are not Installed
```

---

##  Infrastructure Verification Scan Outputs

### Expected Scan Log Breakdown (Terraform Framework)
```text
       _               _
   ___| |__   ___  ___| | _______   __
  / __| '_ \ / _ \/ __| |/ / _ \ \ / /

 | (__| | | |  __/ (__|   < (_) \ V /
  \___|_| |_|\___|\___|_|\_\___/ \_/

By Prisma Cloud | version: 3.4.3

terraform scan results:

Passed checks: 6, Failed checks: 2, Skipped checks: 0

PASSED -> CKV_AZURE_118: "Ensure that Network Interfaces disable IP forwarding"
PASSED -> CKV_AZURE_92:  "Ensure that Virtual Machines use managed disks"
PASSED -> CKV_AZURE_178: "Ensure linux VM enables SSH with keys for secure communication"
PASSED -> CKV_AZURE_179: "Ensure VM agent is installed"
PASSED -> CKV_AZURE_119: "Ensure that Network Interfaces don't use public IPs"

FAILED -> CKV_AZURE_149: "Ensure that Virtual machine does not enable password authentication"
File: /main.tf:22-49 (disable_password_authentication = false)

FAILED -> CKV_AZURE_50:  "Ensure Virtual Machine Extensions are not Installed"
File: /main.tf:22-49
```

### Registered Project Outputs
```hcl
output "vm_name" {
  value = azurerm_linux_virtual_machine.vm.name
}
```
