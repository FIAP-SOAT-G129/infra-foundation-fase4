variable "repositories" {
  description = "A map of ECR repository names to create."
  type        = map(string)
}

variable "tags" {
  description = "Tags to apply to all repositories."
  type        = map(string)
  default     = {}
}
