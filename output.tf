output "public_ip_addresses" {
  description = "The public IP addresses of the EC2 instances"
  value       = aws_instance.ec2_instance.*.public_ip
}

output "user_output" {
  description = "The user of the EC2 instance running"
  value       = local.user
}

output "pass_output" {
  description = "The password of the user of the EC2 instance running"
  value       = nonsensitive(local.password)
}

output "instance_name_output" {
  description = "The names of the ec2 instances"
  value       = local.instance_names
}