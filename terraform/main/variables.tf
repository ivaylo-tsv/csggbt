variable "tags" {
  description = "Generic tags for the container specialty group green belt task project."
  type        = map(string)
  default = {
    "project" = "csggbt"
    "region"  = "eu-west-1"
  }
}

variable "vpc_id" {
  type = string
  default = "vpc-043d2cfa50af1d609"
}

variable "subnet-public-1" {
  type = string
  default = "subnet-04ab6fbe3438af406"
}

variable "subnet-public-2" {
  type = string
  default = "subnet-03fb314300934f19c"
}

variable "subnet-private-1" {
  type = string
  default = "subnet-07f7cf49834906fbc"
}

variable "subnet-private-2" {
  type = string
  default = "subnet-07b5db6eca7261c05"
}
