variable "name" {
  type        = string
  description = "Prefix for subnet names"
}

variable "region" {
  type        = string
  description = "The AWS region to deploy resources in"
}

variable "vpc_id" {
  type        = string
  description = "Associated VPC ID"
}

variable "public_subnets" {
  type = map(object({
    cidr_block = string
    az_suffix  = string
  }))
  description = "Map of public subnet CIDRs with AZ suffix"
}

variable "private_subnets" {
  type = map(object({
    cidr_block = string
    az_suffix  = string
  }))
  description = "Map of private subnet CIDRs with AZ suffix"
}

variable "tags" {
  type    = map(string)
  default = {}
}
