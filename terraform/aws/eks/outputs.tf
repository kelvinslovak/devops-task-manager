output "vpc_id" {
  description = "ID da VPC obtido do state de rede"
  value       = data.terraform_remote_state.network.outputs.vpc_id
}

output "public_subnet_ids" {
  description = "Subnets publicas obtidas do state de rede"
  value       = data.terraform_remote_state.network.outputs.public_subnet_ids
}

output "eks_cluster_role_arn" {
  description = "ARN da Role do cluster obtido do state IAM"
  value       = data.terraform_remote_state.iam.outputs.eks_cluster_role_arn
}

output "eks_nodes_role_arn" {
  description = "ARN da Role dos nodes obtido do state IAM"
  value       = data.terraform_remote_state.iam.outputs.eks_nodes_role_arn
}
