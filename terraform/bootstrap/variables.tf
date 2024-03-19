variable "tags" {
  description = "Generic tags for the container specialty group green belt task project."
  type        = map(string)
  default = {
    "project" = "csggt"
    "region"  = "eu-west-1"
  }
}
