# Terraform Day 5 - Modules

## What is a Module?

A **Terraform Module** is a collection of Terraform configuration files (`.tf`) used to create reusable infrastructure.

> **Definition:** A module is a reusable container of Terraform resources.

---

## Why Use Modules?

- Reuse code
- Reduce duplicate code
- Easy to maintain
- Better project structure
- Faster development

---

## Types of Modules

### 1. Root Module
The main directory where Terraform commands are executed.

Example:
```
provider.tf
main.tf
README.md
```

### 2. Child Module
A module stored inside the `modules/` directory.

Example:
```
modules/
├── ec2/
└── vpc/
```

---

## Project Structure

```
terraform-modules/
│
├── provider.tf
├── main.tf
├── README.md
│
└── modules/
    ├── ec2/
    └── vpc/
```

---

## Calling a Module

```hcl
module "vpc" {
  source = "./modules/vpc"
}

module "ec2" {
  source = "./modules/ec2"
}
```

---

## Passing Variables

```hcl
module "ec2" {
  source        = "./modules/ec2"
  instance_type = "t3.micro"
}
```

---

## Module Output

```hcl
output "instance_id" {
  value = module.ec2.instance_id
}
```

---

## Terraform Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform destroy
```

---

## Advantages

- Reusable code
- Easy maintenance
- Organized project
- Less duplicate code
- Easy collaboration

---

## Interview Questions

### What is a Terraform Module?
A Terraform Module is a reusable collection of Terraform configuration files.

### What is a Root Module?
The directory where Terraform commands are executed.

### What is a Child Module?
A module inside the `modules/` folder that is called by the Root Module.

### What is the purpose of the `source` argument?
It tells Terraform where the module is located.

---

## Summary

- Module = Reusable Terraform code
- Root Module = Main project folder
- Child Module = Module inside `modules/`
- `source` = Module path
- Modules improve code reusability and organization.
