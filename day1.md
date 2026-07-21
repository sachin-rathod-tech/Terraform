# Terraform

## Most Important Commands

```bash
terraform init
terraform fmt
terraform validate
terraform plan
terraform apply
terraform apply -auto-approve
terraform show
terraform state list
terraform output
terraform destroy
terraform destroy -auto-approve
terraform version
```

---

## access file

```bassh
provider "aws" {
  region     = "ap-northeast-2"
  access_key = "UPLOAD ACCESS KEY"
  secret_key = "UPLOAD SERECT KEY"
}
```
---

## instance create 

```bash

resource "aws_instance" "vm1" {
    ami = "ami-0bc151a94289adb52"
    instance_type = "t3.micro"
    key_name = "seoul-key"
    tags = {
      Name = "Terraform-instance"
    }
```
---
