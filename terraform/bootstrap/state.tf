terraform {
  backend "s3" {
    encrypt = true
    key     = "bootstrap/terraform.tfstate"
    bucket  = "tf-state-bucket-079253988715"
    region  = "eu-west-1"
  }
}