output "node_group_name" {
  description = "생성된 NodeGroup 이름"
  value       = aws_eks_node_group.default.node_group_name
}

output "node_group_status" {
  description = "NodeGroup 상태"
  value       = aws_eks_node_group.default.status
}

output "node_role_arn" {
  description = "생성된 IAM Role ARN"
  value       = aws_iam_role.eks_node_role.arn
}

