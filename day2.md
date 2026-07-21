# EC2 Instance with Security Group

```bash
resource "aws_security_group" "gs01" {
    name = "tf-sg"
    vpc_id = "vpc-045f8fa11ce0120a0"

    ingress {
        from_port = 80
        to_port = 80
        protocol = "TCP"
        cidr_blocks = ["0.0.0.0/0"]
    }
    
    ingress {
        from_port = 22
        to_port = 22
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
    vpc_security_group_ids = [aws_security_group.gs01.id]
  
}
```

---

### command 

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
```
