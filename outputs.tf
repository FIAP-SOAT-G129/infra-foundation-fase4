output "vpc_id" {
  value = module.vpc.id
}

output "vpc_cidr_block" {
  value = module.vpc.cidr_block
}

output "private_subnet_ids" {
  value = module.subnets.private_subnet_ids
}

output "public_subnet_ids" {
  value = module.subnets.public_subnet_ids
}
