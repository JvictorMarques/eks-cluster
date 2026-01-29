variable "default_tags" {
  type        = map(string)
  description = "Default tags to apply to all resources"
}

variable "aws_region" {
  type        = string
  description = "AWS region"
  default     = "us-east-1"
}

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