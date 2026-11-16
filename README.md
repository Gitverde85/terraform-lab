# ☁️ Terraform & Azure Infrastructure Labs

This repository is a collection of hands-on labs and projects focused on **Infrastructure as Code (IaC)** using **Terraform** and **Microsoft Azure**. It covers everything from basic resource provisioning to security scanning, reusable modules, remote state management, and a full-scale final capstone architecture.

---

## 🏆 Final Project

* **[`azure-terraform-vm-project`](./azure-terraform-vm-project)** – Complete, production-ready Azure VM infrastructure featuring segmented VNets, dynamic NSGs, Load Balancer, Key Vault SSH management, Log Analytics monitoring, Backup vaults, and FinOps auto-shutdown policies.

---

## 📂 Hands-On Labs Index

### 1. Core Terraform & State Management
* **[`terraform-lab-resource-group`](./terraform-lab-resource-group)** – Initial setup and provisioning of Azure Resource Groups.
* **[`terraform-variables-lab`](./terraform-variables-lab)** – Working with input variables, types, and constraints.
* **[`lab-storage-locals`](./lab-storage-locals)** – Using `locals` for dynamic naming conventions and expressions.
* **[`lab-storage-tfvars`](./lab-storage-tfvars)** – Managing multi-environment configurations with `.tfvars` files.
* **[`lab-storage-ws`](./lab-storage-ws)** – Isolating environments using Terraform Workspaces.
* **[`lab-backend-remote`](./lab-backend-remote)** – Configuring remote state storage in Azure Blob Storage with state locking.
* **[`lab-count-resource-groups`](./lab-count-resource-groups)** – Scaling and iterating resources dynamically using the `count` meta-argument.

### 2. Compute & Modularization
* **[`lab-vm-azure`](./lab-vm-azure)** – Provisioning Linux Virtual Machines, Virtual Networks, and Public IPs on Azure.
* **[`lab-vm-module`](./lab-vm-module)** – Refactoring VM infrastructure into reusable, maintainable Terraform modules.

### 3. DevSecOps & IaC Security (SAST)
* **[`vm-keyvault`](./vm-keyvault)** – Securing sensitive credentials and SSH keys using Azure Key Vault.
* **[`lab-checkov`](./lab-checkov)** – Static code analysis and compliance scanning with **Checkov**.
* **[`lab-vm-trivy`](./lab-vm-trivy)** – Vulnerability and misconfiguration scanning for IaC using **Trivy**.

---

## 🚀 How to Run Any Lab

1. **Clone the repository:**
   ```bash
   git clone https://github.com<YOUR-USERNAME>/terraform-lab.git
   cd terraform-lab
   ```

2. **Authenticate with Azure:**
   ```bash
   az login
   az account set --subscription "<YOUR-SUBSCRIPTION-ID>"
   ```

3. **Navigate to a specific lab and deploy:**
   ```bash
   cd lab-vm-azure
   terraform init
   terraform plan
   terraform apply
   ```

4. **Clean up resources after testing:**
   ```bash
   terraform destroy -auto-approve
   ```
