name = "fastfood"

region = "us-east-1"

vpc_cidr = "10.0.0.0/16"

subnets = {
  public = {
    subnet_1 = { cidr_block = "10.0.1.0/24", az_suffix = "a" }
    subnet_2 = { cidr_block = "10.0.2.0/24", az_suffix = "b" }
  }
  private = {
    subnet_1 = { cidr_block = "10.0.101.0/24", az_suffix = "a" }
    subnet_2 = { cidr_block = "10.0.102.0/24", az_suffix = "b" }
  }
}

ecr_repositories = {
  catalog  = "fastfood-catalog-ms"
  payments = "fastfood-payments-ms"
  order    = "fastfood-order-ms"
}

tags = {
  Project = "fastfood"
}
