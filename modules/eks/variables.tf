variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "eks_version" {
  type        = string
  description = "EKS cluster version"
}

variable "eks_subnet_ids" {
  type        = list(string)
  description = "List of subnet IDs for EKS cluster"
}

variable "principal_arns" {
  type        = set(string)
  description = "Set of principal ARNs for EKS access entries"
}
