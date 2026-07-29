# Terraform Day 7 - Workspace & Taint

## Objective

Learn how to use Terraform Workspaces to manage multiple environments and Terraform Taint to recreate a specific resource.

---

# Terraform Workspace

## What is a Workspace?

A **Terraform Workspace** allows you to manage multiple environments (Dev, Test, Prod) using the same Terraform configuration.

> **Definition:** A Workspace is an isolated Terraform state for a single configuration.

---

## Why Use Workspaces?

- Manage multiple environments
- Separate state files
- Reuse the same Terraform code
- Easy environment switching

---

## Default Workspace

```
default
```

---

## Workspace Commands

### Show Current Workspace

```bash
terraform workspace show
```

### List Workspaces

```bash
terraform workspace list
```

### Create Workspace

```bash
terraform workspace new dev
```

### Switch Workspace

```bash
terraform workspace select dev
```

### Delete Workspace

```bash
terraform workspace delete dev
```

---

## Workspace Workflow

```
Terraform Code
      │
      ▼
Workspace
      │
      ▼
Separate State File
      │
      ▼
Dev / Test / Prod
```

---

# Terraform Taint

## What is Terraform Taint?

Terraform Taint marks a resource for **recreation** during the next `terraform apply`.

> **Definition:** Taint tells Terraform to destroy and recreate a specific resource.

---

## Why Use Taint?

- Resource is corrupted
- Wrong configuration
- Recreate only one resource
- Avoid recreating the entire infrastructure

---

## Taint Command

```bash
terraform taint aws_instance.vm
```

---

## Remove Taint

```bash
terraform untaint aws_instance.vm
```

---

## Recommended Method (Terraform v0.15.2+)

Instead of using `terraform taint`, use:

```bash
terraform apply -replace="aws_instance.vm"
```

---

## Taint Workflow

```
Resource
    │
    ▼
terraform taint
    │
    ▼
Marked for Recreation
    │
    ▼
terraform apply
    │
    ▼
Destroy + Create
```

---

# Commands

```bash
terraform workspace show
terraform workspace list
terraform workspace new dev
terraform workspace select dev
terraform workspace delete dev

terraform taint aws_instance.vm
terraform untaint aws_instance.vm
terraform apply -replace="aws_instance.vm"
```

---

# Interview Questions

### What is a Terraform Workspace?

A Workspace is used to manage multiple environments using the same Terraform configuration.

### What is the default workspace?

```
default
```

### Which command creates a new workspace?

```bash
terraform workspace new dev
```

### What is Terraform Taint?

Terraform Taint marks a resource for destruction and recreation.

### Which command marks a resource as tainted?

```bash
terraform taint aws_instance.vm
```

### Which command removes the taint?

```bash
terraform untaint aws_instance.vm
```

### What is the recommended replacement for `terraform taint`?

```bash
terraform apply -replace="aws_instance.vm"
```

---

# Summary

- Workspace manages multiple environments.
- Each workspace has its own state file.
- Taint recreates only the selected resource.
- `terraform apply -replace` is the modern replacement for `terraform taint`.
