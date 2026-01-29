# eks-cluster
Create a AWS EKS Cluster with Terraform

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement_terraform) | ~> 1.14.3 |
| <a name="requirement_aws"></a> [aws](#requirement_aws) | 6.28.0 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_eks_cluster"></a> [eks_cluster](#module_eks_cluster) | ./modules/eks | n/a |
| <a name="module_network"></a> [network](#module_network) | ./modules/vpc | n/a |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_aws_region"></a> [aws_region](#input_aws_region) | AWS region | `string` | `"us-east-1"` | no |
| <a name="input_default_tags"></a> [default_tags](#input_default_tags) | Default tags to apply to all resources | `map(string)` | n/a | yes |
| <a name="input_eks_cluster_name"></a> [eks_cluster_name](#input_eks_cluster_name) | EKS cluster name | `string` | n/a | yes |
| <a name="input_eks_version"></a> [eks_version](#input_eks_version) | EKS cluster version | `string` | n/a | yes |
| <a name="input_principal_arns"></a> [principal_arns](#input_principal_arns) | Set of principal ARNs for EKS access entries | `set(string)` | n/a | yes |
| <a name="input_subnets_availability_zones"></a> [subnets_availability_zones](#input_subnets_availability_zones) | AZ for public and private subnets | `set(string)` | n/a | yes |
| <a name="input_vpc_cidr_block"></a> [vpc_cidr_block](#input_vpc_cidr_block) | VPC CIDR block | `string` | n/a | yes |
| <a name="input_vpc_name"></a> [vpc_name](#input_vpc_name) | VPC name | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->