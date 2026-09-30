terraform {
  backend "s3" {
    bucket = "backend-storages3-01"
    key = "terraform-statefile/terraform.tfstate"
    region = "us-west-2"
  }
}