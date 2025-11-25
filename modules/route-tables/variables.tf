variable "name" {
  type        = string
  description = "Prefix for subnet names"
}

variable "vpc_id" {
  type        = string
  description = "Associated VPC ID"
}

variable "igw_id" {
  type        = string
  description = "ID of the Internet Gateway"
}

variable "public_subnets" {
  type        = list(string)
  description = "List of public subnet IDs"
}

variable "private_subnets" {
  type        = list(string)
  description = "List of private subnet IDs"
}

variable "nat_id" {
  type        = string
  description = "ID of the NAT Gateway"
}

variable "tags" {
  type    = map(string)
  default = {}
}
