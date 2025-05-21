output "cluster_name" {
  description = "EKS Cluster name"
  value       = aws_eks_cluster.eks_cluster.name
}

output "cluster_ca" {
  description = "EKS CA data(SSL 인증 관련)"
  value       = aws_eks_cluster.eks_cluster.certificate_authority[0].data
}

output "cluster_endpoint" {
  description = "EKS API의 엔드포인트"
  value       = aws_eks_cluster.eks_cluster.endpoint
}

output "cluster_role_arn" {
  description = "EKS Role ARN"
  value       = var.cluster_role_arn
}

output "cluster_oidc_issuer_url" {
  description = "EKS 클러스터의 OIDC provider URL"
  value       = aws_eks_cluster.eks_cluster.identity[0].oidc[0].issuer
}
