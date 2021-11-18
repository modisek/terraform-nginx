output "login" {

  value = "ssh ubuntu@{aws_instance.dev.public_ip} -i ${var.aws_ssh_admin_key_file}"
}
