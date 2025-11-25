resource "aws_ecr_repository" "this" {
  for_each = var.repositories
  name     = each.value

  force_delete = true

  image_scanning_configuration {
    scan_on_push = true
  }

  tags = merge(
    var.tags,
    {
      Name = "${each.value}-ecr",
    }
  )
}
