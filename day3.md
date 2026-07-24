# Terraform Day 3 - AWS VPC

## What is a VPC?

A **Virtual Private Cloud (VPC)** is a logically isolated virtual network in AWS where you can launch AWS resources such as EC2 instances, RDS databases, and Load Balancers.

### Definition

> A VPC is a private virtual network in AWS that allows you to securely launch and manage cloud resources.

---

# Why Do We Use VPC?

- Network isolation
- Secure communication
- Create public and private subnets
- Control traffic using Route Tables
- Internet access using Internet Gateway
- Secure access using Security Groups and NACLs

---

# VPC Components

- VPC
- CIDR Block
- Public Subnet
- Private Subnet
- Internet Gateway (IGW)
- Route Table
- Security Group
- Network ACL (NACL)

---

# VPC Architecture

```

Internet
│
▼
Internet Gateway
│
▼
+-----------------------------------+
| VPC (10.0.0.0/16)                 |
|                                   |
|  Public Subnet    Private Subnet  |
|  10.0.1.0/24      10.0.2.0/24     |
|      │                  │         |
|     EC2               Database    |
+-----------------------------------+

```

---

# Terraform VPC Code

## main.tf

```hcl
resource "aws_vpc" "network" {
    cidr_block = "192.168.0.0/16"
    tags = {
      Name = "my-network"
    }
  
}

resource "aws_subnet" "pub" {
    vpc_id = aws_vpc.network.id
    cidr_block = "192.168.0.0/20"
    availability_zone = "ap-northeast-2a"
    map_public_ip_on_launch = "true"
    tags = {
        Name = "public-sub"
    }
  
}

resource "aws_subnet" "private" {
    vpc_id = aws_vpc.network.id
    cidr_block = "192.168.16.0/20"
    availability_zone = "ap-northeast-2b"
    tags = {
        Name = "private-sub"
    }
  
}

resource "aws_internet_gateway" "my-igw" {
    vpc_id = aws_vpc.network.id
    tags = {
        Name = "vpc-igw"
    }

}
resource "aws_route_table" "my-rt" {
    vpc_id = aws_vpc.network.id
    tags = {
        Name = "pub-rt"
    }
    
    route {
        gateway_id = aws_internet_gateway.my-igw.id
        cidr_block = "0.0.0.0/0"
    }
}

resource "aws_route_table_association" "at-asso" {
    route_table_id = aws_route_table.my-rt.id
    subnet_id = aws_subnet.pub.id
}

resource "aws_security_group" "firewall" {
    vpc_id = aws_vpc.network.id
    tags = {
        Name = "kaali-sg"
    }

    ingress {
        from_port = 22
        to_port = 22
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }

    egress {
        from_port = 0
        to_port = 0
        protocol = "-1"
        cidr_blocks = ["0.0.0.0/0"]
    }

}

resource "aws_instance" "vm1" {
    ami = "ami-0bc151a94289adb52"
    instance_type = "t3.micro"
    key_name = "seoul-key"
    subnet_id = aws_subnet.pub.id
    vpc_security_group_ids = [aws_security_group.firewall.id]
    user_data = <<-EOF
      #!/bin/bash
      apt update -y
      apt install apache2 -y
      systemctl start apache2
      systemctl enable apache2
      echo "<h1>Welcome, Sachin! Build. Automate. Deploy. Repeat" > /var/www/html/index.html
        EOF
    tags = {
      Name = "sachin-instance"
    }

}
```

---

# Explanation

| Line | Description |
|------|-------------|
| provider | Connects Terraform to AWS |
| aws_vpc | Creates a new VPC |
| cidr_block | Defines the IP range of the VPC |
| enable_dns_support | Enables DNS resolution |
| enable_dns_hostnames | Enables public DNS hostnames |
| tags | Adds a name to the VPC |

---

# Commands

Initialize Terraform

```bash
terraform init
```

Format Code

```bash
terraform fmt
```

Validate Configuration

```bash
terraform validate
```

Preview Changes

```bash
terraform plan
```

Create VPC

```bash
terraform apply
```

Create Without Confirmation

```bash
terraform apply -auto-approve
```

Delete VPC

```bash
terraform destroy
```

Delete Without Confirmation

```bash
terraform destroy -auto-approve
```

---

# Verify VPC

Terraform

```bash
terraform show
```

---

# Interview Questions

### What is a VPC?

A VPC (Virtual Private Cloud) is a logically isolated virtual network in AWS used to launch cloud resources securely.

---

### What is the default CIDR block used in this example?

```
10.0.0.0/16
```

---

### Why do we enable DNS Support?

To allow resources inside the VPC to resolve domain names.

---

### Why do we enable DNS Hostnames?

To assign DNS hostnames to EC2 instances that have public IP addresses.

---

### Which Terraform resource is used to create a VPC?

```hcl
resource "aws_vpc" "my_vpc"
```

---

# Workflow

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
AWS VPC Created

```

---

# Quick Revision

- VPC = Virtual Private Cloud
- Used to create a private network in AWS
- `aws_vpc` resource creates a VPC
- CIDR block defines the IP range
- `terraform plan` previews changes
- `terraform apply` creates the VPC
- `terraform destroy` deletes the VPC

---
