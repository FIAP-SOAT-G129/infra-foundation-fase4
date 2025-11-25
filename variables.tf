variable "region" {
  description = "The AWS region to deploy resources in"
  type        = string
}

variable "name" {
  description = "Nome base para recursos"
  type        = string
}

variable "vpc_cidr" {
  description = "CIDR da VPC"
  type        = string
}

variable "subnets" {
  description = "Map of subnets"
  type = object({
    public  = map(object({ cidr_block = string, az_suffix = string }))
    private = map(object({ cidr_block = string, az_suffix = string }))
  })
}

variable "ecr_repositories" {
  description = "Map of ECR repository names to create"
  type        = map(string)
}

variable "tags" {
  description = "Tags padrão"
  type        = map(string)
  default     = {}
}

