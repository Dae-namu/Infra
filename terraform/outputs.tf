output "vpc_id" {
  description = "VPC ID"
  value       = module.vpc.vpc_id
}

output "public_subnet_ids" {
  description = "퍼블릭 서브넷 ID 목록"
  value       = module.vpc.public_subnet_ids
}

output "private_subnet_ids" {
  description = "프라이빗 서브넷 ID 목록"
  value       = module.vpc.private_subnet_ids
}

output "eks_cluster_name" {
  description = "EKS 클러스터 이름"
  value       = module.eks.cluster_name
}

output "eks_cluster_endpoint" {
  description = "EKS API 서버 엔드포인트"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_ca" {
  description = "EKS SSL 인증서"
  value       = module.eks.cluster_ca
}

output "oidc_url" {
  description = "EKS OIDC Provider URL"
  value       = module.eks.cluster_oidc_issuer_url
}

output "alb_dns_name" {
  description = "ALB Ingress의 DNS 이름"
  value       = module.alb.alb_dns_name
}
