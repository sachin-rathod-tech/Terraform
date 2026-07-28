# Terraform Day 6 - Backend (S3 Backend)

## Objective

Learn how to store the Terraform state file remotely using an AWS S3 Backend.

---

# What is a Backend?

A **Terraform Backend** is used to store the Terraform state file (`terraform.tfstate`) and manage Terraform operations.

> **Definition:** A backend determines where Terraform stores its state file.

---

# Why Do We Use a Backend?

- Store state file remotely
- Team collaboration
- State locking
- Prevent state file loss
- Secure infrastructure management

---

# Types of Backends

## 1. Local Backend (Default)

Stores the state file on your local machine.

```
terraform.tfstate
```

**Advantages**

- Easy to configure
- Good for learning

**Disadvantages**

- Not suitable for teams
- No state locking
- State file can be lost

---

## 2. Remote Backend

Stores the state file remotely.

Examples:

- AWS S3
- Terraform Cloud
- Azure Storage
- Google Cloud Storage

---

# S3 Backend Configuration

Create a file named **backend.tf**

```hcl
terraform {
  backend "s3" {
    bucket  = "my-terraform-state-bucket"
    key     = "backend/terraform.tfstate"
    region  = "ap-northeast-2"
    profile = "default"
  }
}
```

---

# Project Structure

```
terraform-backend/
│
├── provider.tf
├── backend.tf
├── main.tf
└── README.md
```

---

# Initialize Backend

```bash
terraform init
```

Terraform will initialize the S3 backend and migrate the local state file if required.

---

# Useful Commands

Initialize

```bash
terraform init
```

Reconfigure Backend

```bash
terraform init -reconfigure
```

Migrate State

```bash
terraform init -migrate-state
```

Plan

```bash
terraform plan
```

Apply

```bash
terraform apply
```

Destroy

```bash
terraform destroy
```

---

# Backend Workflow

```
Terraform Apply
        │
        ▼
Read State File
        │
        ▼
Create / Update Infrastructure
        │
        ▼
Save Updated State to S3
```

---

# Local Backend vs Remote Backend

| Local Backend | Remote Backend |
|---------------|----------------|
| Stores state locally | Stores state in S3 |
| Single user | Team collaboration |
| No state locking | Supports state locking |
| Less secure | More secure |

---

# Advantages of S3 Backend

- Remote state storage
- Secure state management
- Team collaboration
- Centralized state file
- Easy backup
- Supports versioning (when enabled on the bucket)

---

# Interview Questions

### What is a Terraform Backend?

A backend determines where Terraform stores its state file.

### What is the default backend?

Local Backend.

### Why do we use an S3 Backend?

To store the Terraform state file remotely for collaboration, security, and centralized state management.

### Which command initializes the backend?

```bash
terraform init
```

### Which file contains the backend configuration?

```
backend.tf
```

---

# Summary

- Backend stores the Terraform state file.
- Local backend stores the state on your computer.
- Remote backend stores the state in AWS S3.
- Use `terraform init` after adding or changing a backend.
- S3 Backend is recommended for production environments.
