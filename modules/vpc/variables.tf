variable "vpc_name" {
  type        = string
  description = "VPC name"
  default     = "eks-cluster"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block"
  default     = "10.0.0.0/16"
}

variable "subnets_availability_zones" {
  type        = set(string)
  description = "Values of availability zones for public and private subnets"

  validation {
    condition     = length(var.subnets_availability_zones) > 0
    error_message = "You must to have at least one Availability Zones"
  }
}

variable "eks_cluster_name" {
  type        = string
  description = "EKS cluster name for subnet tagging"
}