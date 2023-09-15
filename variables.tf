variable "region" {
  description = "Region where the instances be deployed;"
  type = string
  default = "us-east-1"
}

variable "env" {
  description = "The ID of the Amazon Machine Image (AMI) to use for the EC2 instances"
  default = "dev"
}

variable "instance_os" {
  description = "The OS to use for the EC2 instances"
  default = "ubuntu22.04"
}

variable "instance_type" {
  description = "The real EC2 instance type to be used"
  default = "medium"
}

variable "instance_count" {
  description = "The number of EC2 instances to launch"
  default = "1"
}

variable "cli_user" {
  description = "The CLI user owner of the resource created."
  default     = "racosta"
}

variable "service" {
  description = "The CLI service running in this module."
  default     = "VM"
}

