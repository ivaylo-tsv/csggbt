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
  default = "vpc-09e0ab1f392ec9243"
}

variable "subnet-public-1" {
  type = string
  default = "subnet-0c4a1034bd7129f63"
}

variable "subnet-public-2" {
  type = string
  default = "subnet-013cbf36fe9fc8e9a"
}

variable "subnet-private-1" {
  type = string
  default = "subnet-0e3059baeec15f805"
}

variable "subnet-private-2" {
  type = string
  default = "subnet-05be528fe4e96dcba"
}
