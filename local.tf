locals {
  inst_name = lower(format("%s-%s-%s",var.env,var.cli_user,random_string.instance_name.result))
  instance_names = [for i in range(var.instance_count): "${local.inst_name}-${i+1}"]
  user = lower(format("%s-%s-%s",var.env,var.cli_user,var.service))
  password = random_password.pw.result
  cluster_name = "testing"
  vm_size_map = {
    "small"   = "t3.micro"
    "medium" = "t3.small"
    "large"     = "t3.medium"
  }
  vm_os_map = {
    "amazonlinux"   = "ami-06e46074ae430fba6"
    "ubuntu22.04" = "ami-007855ac798b5175e"
    "debian11"     = "ami-0fec2c2e2017f4e7b"
  }
  vm_subnet_map = {
    "dev"   = "${module.vpc.public_subnets[0]}"
    "stg" = "stg-sn"
    "prod"     = "prod-sn"
  }
  vm_vpc_map = {
    "dev"   = "${module.vpc.vpc_id}"
    "stg" = "stg-vpc"
    "prod"     = "prod-vpc"
  }
  vm_sg_map = {
    "dev"   = "${module.vpc.sg}"
    "stg" = "stg-sg"
    "prod"     = "prod-sg"
  }
}

