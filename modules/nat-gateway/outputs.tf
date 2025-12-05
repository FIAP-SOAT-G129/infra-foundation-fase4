output "nat_id" {
  description = "NAT Gateway ID"
  value       = aws_nat_gateway.ngw.id
}

output "nat_public_ip" {
  description = "NAT Gateway Public IP"
  value       = aws_eip.nat.public_ip
}
