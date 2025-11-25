terraform {
  backend "s3" {
    bucket = "fastfood-tf-states"
    key    = "infra/foundation/terraform.tfstate"
    region = "us-east-1"
  }
}
