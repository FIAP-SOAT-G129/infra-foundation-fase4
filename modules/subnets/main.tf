resource "aws_subnet" "public" {
  for_each                = var.public_subnets
  vpc_id                  = var.vpc_id
  cidr_block              = each.value.cidr_block
  availability_zone       = "${var.region}${each.value.az_suffix}"
  map_public_ip_on_launch = true

  tags = merge(
    var.tags,
    {
      Name                                        = "${var.name}-public-${each.key}"
      "kubernetes.io/role/elb"                    = "1"
      "kubernetes.io/cluster/${var.name}-cluster" = "shared"
    }
  )
}

resource "aws_subnet" "private" {
  for_each          = var.private_subnets
  vpc_id            = var.vpc_id
  cidr_block        = each.value.cidr_block
  availability_zone = "${var.region}${each.value.az_suffix}"

  tags = merge(
    var.tags,
    {
      Name                                        = "${var.name}-private-${each.key}"
      "kubernetes.io/role/internal-elb"           = "1"
      "kubernetes.io/cluster/${var.name}-cluster" = "shared"
    }

  )
}
