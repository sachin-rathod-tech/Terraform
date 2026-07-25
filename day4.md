# Terraform Day 4 - Variables & Outputs

## Objective

Learn how to use **Variables** and **Outputs** in Terraform to make configurations reusable and display useful resource information.

---

# What are Variables?

Variables allow you to pass input values into your Terraform configuration instead of hardcoding them.

### Definition

> Variables are used to make Terraform configurations reusable and flexible.

---

# Why Use Variables?

- Avoid hardcoding values
- Reusable code
- Easy to maintain
- Easy to change environment values
- Better project structure

---

# variable.tf

```hcl
variable "ami_id" {
  description = "AMI ID"
  type        = string
}

variable "ins_type" {
  description = "EC2 Instance Type"
  type        = string
}

variable "key_pair" {
  description = "AWS Key Pair"
  type        = string
}
```

---

# terraform.tfvars

```hcl
ami_id   = "ami-0bc151a94289adb52"
ins_type = "t3.micro"
key_pair = "seoul-key"
```

---

# main.tf

```hcl
resource "aws_instance" "vm1" {

  ami           = var.ami_id
  instance_type = var.ins_type
  key_name      = var.key_pair

  tags = {
    Name = "vm-1"
  }

}
```

---

# Variable Workflow

```
variable.tf
      │
      ▼
terraform.tfvars
      │
      ▼
main.tf
      │
      ▼
terraform apply

```

# Terraform Commands

## Initialize

```bash
terraform init
```

Downloads required provider plugins.

---

## Format

```bash
terraform fmt
```

Formats Terraform code.

---

## Validate

```bash
terraform validate
```

Checks configuration syntax.

---

## Preview Changes

```bash
terraform plan
```

Shows what Terraform will create.

---

## Create Infrastructure

```bash
terraform apply
```

Creates AWS resources.

---

## Apply Without Confirmation

```bash
terraform apply -auto-approve
```

---

## Show Outputs

```bash
terraform output
```

Displays all output values.

---

## Show Specific Output

```bash
terraform output public_ip
```

---

## Destroy Infrastructure

```bash
terraform destroy
```

---

## Destroy Without Confirmation

```bash
terraform destroy -auto-approve
```

---


# Interview Questions

### What is a Variable?

A variable is used to pass input values into Terraform configurations.

---

# Quick Revision

- Variables make Terraform reusable.
- `variable.tf` declares variables.
- `terraform.tfvars` stores variable values.
- `output.tf` displays resource information.
- Use `var.<variable_name>` to access a variable.
- Use `terraform output` to display output values.

---

