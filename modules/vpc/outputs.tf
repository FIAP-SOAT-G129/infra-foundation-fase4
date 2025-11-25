output "id" {
  description = "ID of the created VPC"
  value       = aws_vpc.this.id
}

output "cidr_block" {
  description = "CIDR block of the created VPC"
  value       = aws_vpc.this.cidr_block

}
