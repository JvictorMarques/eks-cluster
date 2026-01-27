variable "vpc" {
  type = object({
    name       = optional(string, "eks-cluster")
    cidr_block = string
  })
  description = "Values of VPC configuration"
  default = {
    cidr_block = "10.0.0.0/16"
  }
}

variable "subnets_availability_zones" {
  type        = set(string)
  description = "Values of availability zones for public and private subnets"
  default     = ["us-east-1a", "us-east-1b"]

  validation {
    condition     = length(var.subnets_availability_zones) > 0
    error_message = "You must to have at least one Availability Zones"
  }
}