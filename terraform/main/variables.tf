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
  default = "vpc-05833c0b87c74ee02"
}

variable "subnet-public-1" {
  type = string
  default = "subnet-0b3275123d781b962"
}

variable "subnet-public-2" {
  type = string
  default = "subnet-08af3d13110fa8da7"
}

variable "subnet-private-1" {
  type = string
  default = "subnet-0d3a04c2555a0bf82"
}

variable "subnet-private-2" {
  type = string
  default = "subnet-05c93efdb8a410988"
}
