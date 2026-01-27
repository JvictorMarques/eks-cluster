
variable "vpc" {
  type = object({
    name       = string
    cidr_block = string
  })
  description = "Values of VPC configuration"
}

variable "subnets_availability_zones" {
  type        = set(string)
  description = "AZ for public and private subnets"
}