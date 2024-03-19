terraform {
  backend "s3" {
    encrypt = true
    key     = "main/terraform.tfstate"
    bucket  = "tf-state-bucket-079253988715"
    region  = "eu-west-1"
  }
}