# Azure Infrastructure CI/CD Pipeline with Terraform

This repository provides automated provisioning and management of Azure infrastructure (Resource Groups, Storage Accounts) using modular **Terraform** configurations and a **GitHub Actions** CI/CD deployment pipeline.

---

## 📋 Table of Contents

- [Overview](#-overview)
- [Repository Structure](#-repository-structure)
- [Infrastructure Modules](#-infrastructure-modules)
- [Prerequisites](#-prerequisites)
- [CI/CD Pipeline Workflow](#-cicd-pipeline-workflow)
- [Getting Started Locally](#-getting-started-locally)
- [Configuration & Variables](#-configuration--variables)

---

## ℹ️ Overview

This project automates the creation and lifecycle management of Azure cloud resources using infrastructure-as-code (IaC). It leverages modularized Terraform scripts to deploy:
- **Azure Resource Group** (Centralized resource management)
- **Azure Storage Account** (Scalable cloud storage)

Automated testing (format checking, syntax validation, infrastructure planning) and continuous deployment are managed via GitHub Actions.

---

## 📁 Repository Structure

```
.
├── .github/
│   └── workflows/
│       └── newpipe.yml        # GitHub Actions CI/CD Pipeline definition
├── moduel/
│   ├── pre/                   # Pre-production / Staging modules
│   │   ├── RG/                # Resource Group module
│   │   │   ├── main.tf
│   │   │   ├── output.tf
│   │   │   └── variable.tf
│   │   └── Storage/           # Storage Account module
│   │       ├── main.tf
│   │       └── variable.tf
│   └── prod/                  # Production modules placeholder
├── backend.tf                 # Terraform Azure Blob remote backend configuration
├── main.tf                    # Root Terraform file invoking environment modules
├── prv.tf                     # Provider declarations (hashicorp/azurerm)
├── terraform.tfvars           # Variable values for deployment
├── variable.tf                # Root variable definitions
└── README.md                  # Project documentation
```

---

## 🏗️ Infrastructure Modules

### 1. Resource Group (`./moduel/pre/RG`)
- Creates an Azure Resource Group.
- **Outputs:** `name`, `location`.

### 2. Storage Account (`./moduel/pre/Storage`)
- Provisions an Azure Storage Account dynamically linked to the created Resource Group.
- Configurable settings: Tier (`Standard`/`Premium`), Replication type (`LRS`, `GRS`, etc.).

---

## 🔑 Prerequisites

Before deploying locally or running CI/CD pipelines, ensure you have:

1. **Terraform CLI** (`>= 1.0.0`) installed.
2. **Azure CLI** installed & logged in (`az login`).
3. **Azure Subscription** with permissions to create Resource Groups and Storage Accounts.
4. **GitHub Secret**: Add `AZURE_CREDENTIALS` (Service Principal JSON) to your GitHub repository secrets for automated deployment.

---

## 🚀 CI/CD Pipeline Workflow

The GitHub Actions workflow (`.github/workflows/newpipe.yml`) automates infrastructure checks and deployment:

### Triggers:
- **Push**: `feature/branch`
- **Pull Request**: `main`
- **Manual**: `workflow_dispatch`

### Pipeline Steps:
1. **Checkout Repository**: Pulls code into the runner environment.
2. **Azure Login**: Authenticates using `secrets.AZURE_CREDENTIALS`.
3. **Setup Terraform**: Installs Terraform CLI.
4. **Format Check (`terraform fmt -check`)**: Validates standard code formatting.
5. **Init (`terraform init`)**: Initializes providers and module dependencies.
6. **Validate (`terraform validate`)**: Checks code syntax and schema validity.
7. **Plan (`terraform plan`)**: Previews infrastructure updates.
8. **Apply (`terraform apply -auto-approve`)**: Executes infrastructure creation (runs on `push` to `main` branch).

---

## 💻 Getting Started Locally

To deploy infrastructure manually from your local machine:

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd pipeline
   ```

2. **Initialize Terraform**:
   ```bash
   terraform init
   ```

3. **Format & Validate Code**:
   ```bash
   terraform fmt
   terraform validate
   ```

4. **Preview Execution Plan**:
   ```bash
   terraform plan
   ```

5. **Deploy Resources**:
   ```bash
   terraform apply
   ```

6. **Destroy Resources (Cleanup)**:
   ```bash
   terraform destroy
   ```

---

## ⚙️ Configuration & Variables

Infrastructure parameters are configured in `terraform.tfvars`:

```hcl
rg = {
  name     = "RG"
  location = "centralindia"
}

storage = {
  name                     = "storagetest10aug26"
  account_tier             = "Standard"
  account_replication_type = "LRS"
}
```