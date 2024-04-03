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
  default = "vpc-07de10dd948fdc62e"
}

variable "subnet-public-1" {
  type = string
  default = "subnet-0b9d140587548db27"
}

variable "subnet-public-2" {
  type = string
  default = "subnet-0b40681db5f0ea87c"
}

variable "subnet-private-1" {
  type = string
  default = "subnet-0dd132a2394ce63d6"
}

variable "subnet-private-2" {
  type = string
  default = "subnet-0cc2f4ab02c10c366"
}
