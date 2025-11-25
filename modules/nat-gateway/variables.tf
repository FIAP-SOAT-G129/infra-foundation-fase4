variable "name" {
  type        = string
  description = "Prefix for subnet names"
}

variable "vpc_id" {
  type        = string
  description = "Associated VPC ID"
}

variable "public_subnet_id" {
  type        = string
  description = "ID of the public subnet for the NAT Gateway"
}

variable "tags" {
  type    = map(string)
  default = {}
}
