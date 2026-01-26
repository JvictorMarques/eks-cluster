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

variable "subnets" {
  type = object({
    availability_zone = list(string)
  })
  description = "Values from Subnets public and private configuration"
  default = {
    availability_zone = ["us-east-1a", "us-east-1b"]
  }
}