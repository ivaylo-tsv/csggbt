variable "tags" {
  description = "Generic tags for the container specialty group green belt task project."
  type        = map(string)
  default = {
    "project" = "csggbt"
    "region"  = "eu-west-1"
  }
}

variable "private_subnet_tags" {
  description = "For EKS Ingress"
  type = map(string)
  default = {
    "kubernetes.io/role/internal-elb" = "1"
  }
}

variable "public_subnet_tags" {
  description = "For EKS Ingress"
  type = map(string)
  default = {
    "kubernetes.io/role/elb" = "1"
  }
}