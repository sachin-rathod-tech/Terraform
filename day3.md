# Terraform Day 3 - AWS VPC

### Definition

> A VPC is a private virtual network in AWS that allows you to securely launch and manage cloud resources.

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
