module "vpc" {
  source     = "./modules/vpc"
  name       = var.name
  cidr_block = var.vpc_cidr
  tags       = var.tags
}

module "subnets" {
  source          = "./modules/subnets"
  name            = var.name
  region          = var.region
  vpc_id          = module.vpc.id
  public_subnets  = var.subnets.public
  private_subnets = var.subnets.private
  tags            = var.tags
}

module "internet_gateway" {
  source = "./modules/internet-gateway"
  name   = var.name
  vpc_id = module.vpc.id
  tags   = var.tags
}

module "nat_gateway" {
  source           = "./modules/nat-gateway"
  name             = var.name
  vpc_id           = module.vpc.id
  public_subnet_id = module.subnets.public_subnet_ids[0]
  tags             = var.tags
}

module "route_tables" {
  source          = "./modules/route-tables"
  name            = var.name
  vpc_id          = module.vpc.id
  igw_id          = module.internet_gateway.id
  public_subnets  = module.subnets.public_subnet_ids
  private_subnets = module.subnets.private_subnet_ids
  nat_id          = module.nat_gateway.nat_id
  tags            = var.tags
}

module "ecr" {
  source       = "./modules/ecr"
  tags         = var.tags
  repositories = var.ecr_repositories
}

