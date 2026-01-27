variable "eks" {
  type = object({
    name       = string
    version    = optional(string, "1.34")
    subnet_ids = list(string)
  })
  description = "EKS cluster configuration object including name, version, and subnet_ids"
}
