# Output for eks cluster rolo arn
output "eks_cluster_role_arn" {
  value = aws_iam_role.eks_cluster_role.arn
}
# Output for eks node group role arn
output "eks_node_group_role_arn" {
  value = aws_iam_role.eks_node_group_role.arn
}
