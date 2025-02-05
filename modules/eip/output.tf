output "id" {
  value = aws_eip.this[*].id
}

output "private_ip" {
  value = aws_eip.this[*].private_ip
}

output "public_ip" {
  value = aws_eip.this[*].public_ip
}

output "allocation_id" {
  value = aws_eip.this[*].allocation_id
}

output "association_id" {
  value = aws_eip.this[*].association_id
}
