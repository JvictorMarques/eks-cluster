variable "tags" {
  type        = map(string)
  description = "Default tags for the eks-cluster project"
  default = {
    Project = "eks-cluster"
  }
}
