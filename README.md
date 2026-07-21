# Install Terraform


## Linux 
* ubuntu

```bash
wget -O - https://apt.releases.hashicorp.com/gpg | sudo gpg --dearmor -o /usr/share/keyrings/hashicorp-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(grep -oP '(?<=UBUNTU_CODENAME=).*' /etc/os-release || lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
sudo apt update && sudo apt install terraform
```

```bash
terraform --version
```

---
# Terraform Notes

## What is Terraform?

Terraform is an **Infrastructure as Code (IaC)** tool developed by **HashiCorp**. It is used to create, manage, and automate cloud infrastructure using code.

### Definition

> Terraform is an Infrastructure as Code (IaC) tool used to provision and manage cloud infrastructure.

---

# What is Infrastructure as Code (IaC)?

Infrastructure as Code (IaC) means managing infrastructure using code instead of creating it manually.

### Example

Without Terraform:
- Create EC2 manually
- Create VPC manually
- Create Subnet manually
- Create Security Group manually

With Terraform:

```bash
terraform apply
```

Everything is created automatically.

---

# Why Use Terraform?

- Infrastructure Automation
- Infrastructure as Code
- Multi-Cloud Support
- Version Control
- Reusable Code
- Faster Deployment
- Consistent Infrastructure

---

# Terraform Architecture

```
Terraform Code (.tf)
        │
        ▼
Terraform CLI
        │
        ▼
Provider (AWS, Azure, GCP)
        │
        ▼
Cloud Infrastructure
```

---

# Terraform Components

## 1. Provider

A Provider allows Terraform to communicate with cloud platforms.

Examples:
- AWS
- Azure
- Google Cloud

Example:

```hcl
provider "aws" {
  region = "ap-south-1"
}
```

---

## 2. Resource

A Resource represents the infrastructure created by Terraform.

Examples:
- EC2 Instance
- VPC
- S3 Bucket
- Security Group

Example:

```hcl
resource "aws_instance" "web" {
  ami           = "ami-xxxxxxxx"
  instance_type = "t2.micro"
}
```

---

## 3. Variable

Variables are used to make Terraform code reusable.

Example:

```hcl
variable "instance_type" {
  default = "t2.micro"
}
```

---

## 4. Output

Outputs display information after Terraform creates resources.

Example:

```hcl
output "public_ip" {
  value = aws_instance.web.public_ip
}
```

---

## 5. State File

Terraform stores infrastructure information in:

```
terraform.tfstate
```

Purpose:
- Tracks resources
- Maintains infrastructure state
- Prevents duplicate resource creation

---

# Terraform Workflow

```
Write Code
     │
     ▼
terraform init
     │
     ▼
terraform fmt
     │
     ▼
terraform validate
     │
     ▼
terraform plan
     │
     ▼
terraform apply
     │
     ▼
Infrastructure Created
```

---

# Terraform Commands

## Initialize Project

```bash
terraform init
```

Downloads required provider plugins.

---

## Format Code

```bash
terraform fmt
```

Formats Terraform files.

---

## Validate Code

```bash
terraform validate
```

Checks Terraform syntax.

---

## Preview Changes

```bash
terraform plan
```

Shows what Terraform will create, modify, or delete.

---

## Apply Changes

```bash
terraform apply
```

Creates or updates infrastructure.

---

## Apply Without Confirmation

```bash
terraform apply -auto-approve
```

---

## Show Infrastructure State

```bash
terraform show
```

Displays current infrastructure information.

---

## List Resources

```bash
terraform state list
```

Shows all resources managed by Terraform.

---

## Destroy Infrastructure

```bash
terraform destroy
```

Deletes all resources.

---

## Destroy Without Confirmation

```bash
terraform destroy -auto-approve
```

---

## Check Version

```bash
terraform version
```

Displays installed Terraform version.

---

# Terraform File Extensions

| File | Purpose |
|------|---------|
| main.tf | Main configuration |
| variables.tf | Variables |
| outputs.tf | Outputs |
| terraform.tfvars | Variable values |
| provider.tf | Provider configuration |

---

# Advantages

- Open Source
- Multi-Cloud Support
- Infrastructure Automation
- Version Control Friendly
- Reusable Code
- Easy to Maintain

---

# Limitations

- Learning Curve
- State File Management
- Requires Cloud Credentials

---

# Terraform vs CloudFormation

| Terraform | CloudFormation |
|-----------|----------------|
| Multi-Cloud | AWS Only |
| HCL Language | JSON/YAML |
| Open Source | AWS Service |

---

# Terraform vs Ansible

| Terraform | Ansible |
|-----------|----------|
| Infrastructure Provisioning | Configuration Management |
| Creates Resources | Installs Software |
| Declarative | Procedural |

---

# Interview Questions

### What is Terraform?

Terraform is an Infrastructure as Code (IaC) tool used to automate cloud infrastructure.

---

### What is IaC?

Infrastructure as Code is the process of managing infrastructure using code instead of manual configuration.

---

### What is a Provider?

A Provider enables Terraform to interact with cloud platforms such as AWS, Azure, and Google Cloud.

---

### What is a Resource?

A Resource is an infrastructure object created by Terraform.

Examples:
- EC2
- VPC
- S3

---

### What is the State File?

The `terraform.tfstate` file stores information about the infrastructure managed by Terraform.

---

# Memory Trick

```
Terraform
    │
    ▼
Provider
    │
    ▼
Resource
    │
    ▼
Cloud
```

---

# Quick Revision

- Terraform = Infrastructure as Code
- Provider = Connects to Cloud
- Resource = Infrastructure Object
- State File = Stores Infrastructure State
- `terraform init` = Initialize Project
- `terraform fmt` = Format Code
- `terraform validate` = Validate Code
- `terraform plan` = Preview Changes
- `terraform apply` = Create Infrastructure
- `terraform destroy` = Delete Infrastructure

---

# Workflow Summary

```
Write Code
      ↓
terraform init
      ↓
terraform fmt
      ↓
terraform validate
      ↓
terraform plan
      ↓
terraform apply
      ↓
Infrastructure Created
```
