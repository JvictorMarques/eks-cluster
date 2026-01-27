variable "default_tags" {
  type        = map(string)
  description = "Default tags for the eks-cluster project"
  default = {
    Project   = "eks-cluster"
    ManagedBy = "Terraform"
  }
}

variable "project_name" {
  type        = string
  description = "The name of the project"
  default     = "eks-cluster"
}

variable "vpc_cidr_block" {
  type        = string
  description = "VPC CIDR block spec"
  default     = "10.0.0.0/16"
}

variable "subnets_availability_zones" {
  type        = list(string)
  description = "Values of availability zones for public and private subnets"
  default     = ["us-east-1a", "us-east-1b"]
}