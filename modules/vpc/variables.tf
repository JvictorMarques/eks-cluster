variable "vpc" {
  type = object({
    name       = optional(string)
    cidr_block = string
  })
  description = "Values of VPC configuration"
  default = {
    cidr_block = "10.0.0.0/16"
  }
  validation {
    condition     = var.vpc.name != null
    error_message = "You must declare the name of the VPC"
  }
}

variable "subnets_availability_zones" {
  type        = set(string)
  description = "Values of availability zones for public and private subnets"
  default     = ["us-east-1a", "us-east-1b"]
}