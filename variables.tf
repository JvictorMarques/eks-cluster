
variable "vpc_name" {
  type        = string
  description = "VPC name"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
}

variable "subnets_availability_zones" {
  type        = set(string)
  description = "AZ for public and private subnets"
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name"
}

variable "eks_version" {
  type        = string
  description = "EKS cluster version"
}

variable "principal_arns" {
  type        = set(string)
  description = "Set of principal ARNs for EKS access entries"
}