output "id" {
  value = var.create ? aws_security_group.security_group[0].id : null
}