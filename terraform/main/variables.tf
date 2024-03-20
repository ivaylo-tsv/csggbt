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
  default = "vpc-024db5111bd5006f8"
}

variable "subnet_public" {
  type = string
  default = "subnet-0b9d140587548db27"
}

variable "subnet_private-1" {
  type = string
  default = "subnet-0b0c7e360b15ad627"
}

variable "subnet_private-2" {
  type = string
  default = "subnet-053bf11a097d8f600"
}