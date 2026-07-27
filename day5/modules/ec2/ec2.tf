resource "aws_instance" "vm" {
    ami = var.ami_id
    instance_type = var.ins_type
    key_name = var.key_pair
    subnet_id = var.subnet_id
    vpc_security_group_ids = [var.security_group_id]
    user_data = <<-EOF
        #!/bin/bash
        yum update
        yum install https -y
        systemctl start https
        echo "<h1>Hello Sachin Wellcome !" > /var/www/html/index.html
        EOF
    tags = {
      Name = "my-vm1"
    }
}
