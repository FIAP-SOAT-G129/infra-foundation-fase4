variable "name" {
  type        = string
  description = "Prefix for subnet names"
}

variable "vpc_id" {
  type        = string
  description = "Associated VPC ID"
}

variable "tags" {
  type    = map(string)
  default = {}
}
