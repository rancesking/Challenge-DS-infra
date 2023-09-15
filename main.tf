#Random user password for the EC2 instance
resource "random_password" "pw" {
  length  = 16
  special = false
}

# Randomly generated instance name
resource "random_string" "instance_name" {
  length  = 8
  special = false
}

module "vpc" {
  source                  = "./modules/vpc"
  cluster-name            = local.cluster_name
}

#Create desired EC2 instances with random name & cloud-init script
resource "aws_instance" "ec2_instance" {
  count                  = var.instance_count
  ami                    = lookup(local.vm_os_map, var.instance_os)
  instance_type          = lookup(local.vm_size_map, var.instance_type)
  vpc_security_group_ids = [lookup(local.vm_sg_map, var.env)]
  subnet_id              = lookup(local.vm_subnet_map, var.env)

  tags = {
    Name = local.instance_names[count.index]
  }
  user_data = <<-EOF
              #!/bin/bash
              export VAR_USER=${local.user}
              export VAR_PASSWORD=${local.password}
              ${file("${path.module}/cloud-init.sh")}
              EOF
}