variable "default_tags" {
  type        = map(string)
  description = "Default tags for the eks-cluster project"
  default = {
    Project   = "eks-cluster"
    ManagedBy = "Terraform"
  }
}

variable "vpc" {
  type = object({
    tags       = map(string)
    cidr_block = string
  })
  description = "Values from VPC configuration"
  default = {
    tags = {
      Name = "eks-cluster-vpc"
    }
    cidr_block = "10.0.0.0/16"
  }
}

variable "subnets_availability_zones" {
  type        = list(string)
  description = "Values of availability zones for public and private subnets"
  default     = ["us-east-1a", "us-east-1b"]
}